FROM rust:1.45 as builder
WORKDIR /usr/src/rocket-hello-world
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
COPY --from=builder /usr/local/cargo/bin/rocket-hello-world /usr/local/bin/rocket-hello-world
CMD ["rocket-hello-world"]