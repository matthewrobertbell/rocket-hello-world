FROM rust:slim-buster as builder
WORKDIR /usr/src/rocket-hello-world
COPY . .
RUN cargo test
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/rocket-hello-world ./
COPY Rocket.toml ./
CMD ["./rocket-hello-world"]