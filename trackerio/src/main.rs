use ::std::sync::Arc;
use ::std::error::Error;
use ::std::collections::HashMap;
use axum::{
    Json,
    routing,
    http::StatusCode,
    Router,
    extract::Query,
};
use lazy_static::lazy_static;
use serde::Deserialize;

mod items;

use items::{
    FOOD_ITEMS,
    TECH_ITEMS,
    GENERIC_ITEMS,
    ItemCost,
    ItemRecord,
};

struct InternalAppState {
    client: reqwest::Client, // incase we wish to make api calls
}
type AppState = Arc<InternalAppState>;
type ServerResponse = (StatusCode, String);

fn status_response<E: ToString>(status: StatusCode, error: E) -> ServerResponse {
    (status, error.to_string())
}
fn internal_server_error<E: ToString>(err: E) -> ServerResponse {
    status_response(StatusCode::INTERNAL_SERVER_ERROR, err)
}

// Set up "constants" which get initialised later
lazy_static!{
    static ref DEVELOPMENT_MODE: bool = {
        !lambda_web::is_running_on_lambda() 
    };
}

async fn ignore() -> Result<(),()> {
    Ok(())
}

// "catagory" query enum
#[derive(Deserialize)]
enum CostCatagory {
    Generic, // Select generic list
    Tech,    // Select tech list
    Food,    // Select food list
}
// This struct describes the query parameters
#[derive(Deserialize)]
struct CostQuery {
    cost: f64,
    catagory: CostCatagory,
}
// API Endpoint to retrieve items, based on given cost
// and catagory
async fn get_items_from_cost(mut cost_query: Query<CostQuery>) -> Result<Json<ItemCost>, ServerResponse> {
    if cost_query.cost > 10_000.0 {
        return Err(internal_server_error("Cost is too large"));
    }
    if cost_query.cost <= 0.0 {
        return Ok(Json(ItemCost{left: 0.0, items: Vec::new()}))
    }
    #[allow(non_snake_case)]
    let ITEMS_LIST = match cost_query.catagory {
        CostCatagory::Tech => TECH_ITEMS,
        CostCatagory::Food => FOOD_ITEMS,
        CostCatagory::Generic => GENERIC_ITEMS,
    };
    let mut items_selected = HashMap::new();
    // slow but fast enough since our list is small
    // this just iterates over our list of items
    // picks the most expensive but afforadable one
    // and adds it into items_selected hashmap, then
    // it decrements the current cost for the next
    // iteration
    loop {
        let mut greatest_cost = 0.0;
        let mut greatest_index = ITEMS_LIST.len(); // NOTICE: This is safe as indexes are
                                                   // 0-indexed in Rust
        for (index, item) in ITEMS_LIST.iter().enumerate() {
            if greatest_cost < item.0 && item.0 <= cost_query.cost {
                greatest_cost = item.0;
                greatest_index = index;
            }
        }
        if greatest_index == ITEMS_LIST.len() {
            // stop if there has been no change
            break
        }
        cost_query.cost -= greatest_cost;
        items_selected.entry(greatest_index).and_modify(|count| *count += 1).or_insert(1);
    }
    // Convert our HashMap into a Vector
    let mut returned_items: Vec<ItemRecord> = Vec::new();
    for (index, count) in items_selected {
        returned_items.push(ItemRecord {
            count,
            cost: ITEMS_LIST[index].0,
            label: ITEMS_LIST[index].1,
        });
    }
    Ok(Json(ItemCost{
        items: returned_items,
        left: (cost_query.cost * 100.0).round() / 100.0, // Round to 2.d.p
    }))
}

#[tokio::main]
async fn main() -> Result<(), Box<dyn Error + Send + Sync>> {
    // Set up tracing
    lazy_static::initialize(&DEVELOPMENT_MODE);
    if *DEVELOPMENT_MODE {
        tracing_subscriber::fmt()
            .without_time()
            .init();
    } else {
        tracing_subscriber::fmt()
            .with_max_level(tracing::Level::INFO)
            .with_target(false)
            .without_time()
            .init();
    }

    // Read environment variables, using dotenvy
    tracing::info!("Loading environment variables");

    // Create AppState
    tracing::info!("Creating AppState");
    let appstate = Arc::new(InternalAppState {
        client: reqwest::Client::new(),
    });

    // Define our routes using Axum's router
    tracing::info!("Setting up routers");
    let app = Router::new()
            .route("/", routing::any(ignore))
            .route("/get-items", routing::get(get_items_from_cost))
            .layer(
                tower_http::cors::CorsLayer::new()
                    .allow_headers([
                            "content-type".parse::<axum::http::HeaderName>().unwrap(),
                    ])
                    .expose_headers([
                            "content-type".parse::<axum::http::HeaderName>().unwrap(),
                    ])
                    .allow_methods([
                            axum::http::method::Method::GET,
                            axum::http::method::Method::OPTIONS,
                    ])
                    .allow_origin(
                           "*".parse::<axum::http::HeaderValue>().unwrap() 
                        )
            )
            .fallback(ignore)
            .with_state(appstate);

    // Start the service
    if lambda_web::is_running_on_lambda() {
        tracing::info!("Beginning Lambda HTTP runtime using Axum");
        lambda_web::run_hyper_on_lambda(app).await
    } else {
        tracing::info!("Beginning Axum local server at http://127.0.0.1:8080");
        let addr = ::std::net::SocketAddr::from(([127, 0, 0, 1], 8080));
        axum::Server::bind(&addr).serve(app.into_make_service()).await?;
        Ok(())
    }
}

