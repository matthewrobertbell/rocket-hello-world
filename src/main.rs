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

    let figment = rocket::Config::figment()
        .merge(("address", "0.0.0.0"))
        .merge(("port", port));
    rocket::custom(figment).mount("/", routes![hello])
}
