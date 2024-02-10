use serde::Serialize;

// List of generic items
pub const GENERIC_ITEMS: [(f64, &'static str); 14] = [
    (559.99, "Intel Core i9 Processor"),
    (269.00, "Sennheiser Momentum 4 Headphones"),
    (140.00, "Apple Pencil 2nd Generation"),
    (080.00, "Gaming Chair"),
    (060.00, "1TB SSD"),
    (050.00, "16GB RAM Stick"),
    (025.00, "Jacket"),
    (020.00, "ChatGPT-4 Subscription"),
    (009.00, "Grand Theft Auto V"),
    (006.00, "Cheese Burger"),
    (003.85, "Sandwich, Crisps, and Drink combo"),
    (001.50, "Popcorn"),
    (001.30, "Doritos"),
    (001.00, "Haribos Starmix"),
];
// List of technology items
pub const TECH_ITEMS: [(f64, &'static str); 14] = [
    (559.99, "Intel Core i9 Processor"),
    (479.99, "PlayStation 5 Console"),
    (289.00, "Galaxy Watch6 Series"),
    (269.00, "Sennheiser Momentum 4 Headphones"),
    (259.99, "Nintendo Switch Console"),
    (229.00, "Apple Airpods Pro 2nd Generation"),
    (249.99, "Xbox Series S"),
    (140.00, "Apple Pencil 2nd Generation"),
    (060.00, "1TB SSD"),
    (050.00, "16GB RAM Stick"),
    (023.00, "LED Strips"),
    (020.00, "ChatGPT-4 Subscription"),
    (005.00, "Lightning Cable"),
    (003.99, "HDMI Cable"),
];
// List of food items
pub const FOOD_ITEMS: [(f64, &'static str); 14] = [
    (004.99, "Holland & Barrett House Blend Coffee Beans"),
    (002.90, "Big & Free Large White Free Range Eggs 10 Pack"),
    (001.35, "Warburtons Half and Half Medium Bread"),
    (001.20, "Tesco British Whole Milk"),
    (002.99, "Cathedral City Mature Cheddar Cheese"),
    (000.65, "Apples"),
    (001.70, "Heinz Cream Of Chicken Soup"),
    (007.15, "Tesco Olive Oil"),
    (005.50, "Frozen Pizza Express American Pizza"),
    (006.99, "Dominos Create Your Own Pizza"),
    (003.40, "Kellogg's Crunchy Nut Breakfast Cereal"),
    (003.50, "Weetabix Cereal"),
    (000.75, "Bananas"),
    (000.95, "Mangos"),
];

#[derive(Serialize)]
pub struct ItemRecord {
    pub count: usize,         // Number of times this item can be used
    pub cost: f64,            // The cost of this item
    pub label: &'static str,  // The name of this item
}

#[derive(Serialize)]
pub struct ItemCost {
    pub left: f64,              // How much the user has left over
    pub items: Vec<ItemRecord>, // List of items
}
