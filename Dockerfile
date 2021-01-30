FROM rust:slim-buster as builder
WORKDIR /usr/src/rocket-hello-world
COPY . .
RUN cargo test
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/rocket-hello-world /usr/local/bin/rocket-hello-world
ENTRYPOINT ["rocket-hello-world"]