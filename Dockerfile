FROM rust:slim-buster as builder
COPY . .
RUN cargo test
RUN cargo build

FROM debian:buster-slim
COPY --from=builder target/debug/rocket-hello-world ./
CMD ["./rocket-hello-world"]
