use ::std::sync::Arc;
use ::std::error::Error;
use axum::{
    routing,
    http::StatusCode,
    Router,
    extract::{Query, State},
};
use lazy_static::lazy_static;
use serde::Deserialize;

struct InternalAppState {
    client: reqwest::Client,
}
type AppState = Arc<InternalAppState>;
type ServerResponse = (StatusCode, String);

fn status_response<E: ToString>(status: StatusCode, error: E) -> ServerResponse {
    (status, error.to_string())
}
fn internal_server_error<E: ToString>(err: E) -> ServerResponse {
    status_response(StatusCode::INTERNAL_SERVER_ERROR, err)
}

lazy_static!{
    static ref DEVELOPMENT_MODE: bool = {
        !lambda_web::is_running_on_lambda() 
    };
    static ref API_NINJA_KEY: String = {
        let raw_key = dotenvy::var("API_NINJA_KEY").expect("No environment variable for API_NJNA_KEY").to_owned();
        raw_key
    };
}

// ANY API endpoint
// Request will be ignored
// Responds with BAD_REQUEST "Invalid use of API"
async fn reject() -> Result<(), ServerResponse> {
    Err(status_response(StatusCode::BAD_REQUEST, "Invalid use of API"))
}

#[derive(Deserialize)]
struct RecipeQuery {
    recipe: String,
}

async fn recipe_search(State(appstate): State<AppState>, recipe_query: Query<RecipeQuery>) -> Result<String, ServerResponse> {
    let res = appstate.client.get(format!("https://api.api-ninjas.com/v1/recipe?query={}", recipe_query.recipe))
        .header("X-Api-Key",&*API_NINJA_KEY).send().await;
    match res {
        Ok(res) => {
            Ok(res.text().await.unwrap())
        }
        Err(err) => Err(status_response(StatusCode::INTERNAL_SERVER_ERROR, err))
    }
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
            .route("/search", routing::get(recipe_search))
            .fallback(reject)
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

