#[macro_use]
extern crate rocket;

#[get("/")]
fn hello() -> &'static str {
    "Hello, world! This is Rocket!"
}

#[launch]
fn rocket() -> rocket::Rocket {
    let port: u16 = std::env::var("PORT")
        .ok()
        .and_then(|s| s.parse().ok())
        .unwrap_or(9000);

    let host = std::env::var("HOST")
        .unwrap_or("0.0.0.0".to_string());

    let figment = rocket::Config::figment()
        .merge(("address", host))
        .merge(("port", port));
    rocket::custom(figment).mount("/", routes![hello])
}
