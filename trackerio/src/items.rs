use serde::Serialize;

pub const S3URL: &'static str = "http://trackerio.s3-website.eu-north-1.amazonaws.com/items/";

// List of generic items
pub const GENERIC_ITEMS: [(f64, &'static str, &'static str); 14] = [
    (559.99, "Intel Core i9 Processor", "i9-core-min.png"),
    (269.00, "Sennheiser Momentum 4 Headphones", "momentum-4-min.png"),
    (140.00, "Apple Pencil 2nd Generation", "apple-pencil-min.png"),
    (080.00, "Gaming Chair", "gaming-chair-min.png"),
    (060.00, "1TB SSD", "1tb-ssd-min.png"),
    (050.00, "16GB RAM Stick", "16gb-ram-stick-min.png"),
    (025.00, "Jacket", "jacket-min.png"),
    (020.00, "ChatGPT-4 Subscription", "chatgpt-min.png"),
    (009.00, "Grand Theft Auto V", "gta5-min.png"),
    (001.39, "Cheese Burger", "cheese-burger-min.png"),
    (003.85, "Sandwich, Crisps, and Drink combo", "sandwich-can-crisps-min.png"),
    (001.50, "Popcorn", "popcorn-min.png"),
    (001.30, "Doritos", "doritos-min.png"),
    (001.00, "Haribos Starmix", "haribo-starmix-min.png"),
];
// List of technology items
pub const TECH_ITEMS: [(f64, &'static str, &'static str); 14] = [
    (559.99, "Intel Core i9 Processor", "i9-core-min.png"),
    (479.99, "PlayStation 5 Console", "ps5-min.png"),
    (289.00, "Galaxy Watch6 Series", "galaxy-watch-6-min.png"),
    (269.00, "Sennheiser Momentum 4 Headphones", "momentum-4-min.png"),
    (259.99, "Nintendo Switch Console", "nintendo-switch-min.png"),
    (229.00, "Apple Airpods Pro 2nd Generation", "airpods-pro-2nd-gen-min.png"),
    (249.99, "Xbox Series S", "xbox-series-s-min.png"),
    (140.00, "Apple Pencil 2nd Generation", "apple-pencil-min.png"),
    (060.00, "1TB SSD", "1tb-ssd-min.png"),
    (050.00, "16GB RAM Stick", "16gb-ram-stick-min.png"),
    (023.00, "LED Strips", "led-strip-min.png"),
    (020.00, "ChatGPT-4 Subscription", "chatgpt-min.png"),
    (005.00, "Lightning Cable", "lightning-cable-min.png"),
    (003.99, "HDMI Cable", "hdmi-cable-min.png"),
];
// List of food items
pub const FOOD_ITEMS: [(f64, &'static str, &'static str); 14] = [
    (004.99, "Holland & Barrett House Blend Coffee Beans", "hb-coffee-beans-min.png"),
    (002.90, "Big & Free Large White Free Range Eggs 10 Pack", "eggs-10-pack-min.png"),
    (001.35, "Warburtons Half and Half Medium Bread", "warburtons-bread-min.png"),
    (001.20, "Tesco British Whole Milk", "whole-milk-min.png"),
    (002.99, "Cathedral City Mature Cheddar Cheese", "cathedral-cheddar-cheese-min.png"),
    (000.65, "Apples", "apples-min.png"),
    (001.70, "Heinz Cream Of Chicken Soup", "heinz-chicken-soup-min.png"),
    (007.15, "Tesco Olive Oil", "olive-oil-min.png"),
    (005.50, "Frozen Pizza Express American Pizza", "frozen-pizza-min.png"),
    (006.99, "Dominos Create Your Own Pizza", "dominos-min.png"),
    (003.40, "Kellogg's Crunchy Nut Breakfast Cereal", "kellogg-crunchy-nut-min.png"),
    (003.50, "Weetabix Cereal", "weetabix-cereal-min.png"),
    (000.75, "Bananas", "bananas-min.png"),
    (000.95, "Mangos", "mangos-min.png"),
];

#[derive(Serialize)]
pub struct ItemRecord {
    pub count: usize,         // Number of times this item can be used
    pub cost: f64,            // The cost of this item
    pub label: &'static str,  // The name of this item
    pub image: String,        // URL to image
}

#[derive(Serialize)]
pub struct ItemCost {
    pub left: f64,              // How much the user has left over
    pub items: Vec<ItemRecord>, // List of items
}
