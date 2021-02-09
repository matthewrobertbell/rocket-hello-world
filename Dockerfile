FROM rust:slim-buster as builder
COPY . .
RUN cargo test --release && cargo build --release

FROM debian:buster-slim
COPY --from=builder target/release/rocket-hello-world ./
CMD ["./rocket-hello-world"]
