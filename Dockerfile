FROM rust:slim-buster as builder
WORKDIR /usr/src/rocket-hello-world
COPY . .
RUN cargo test --release
RUN cargo install --path .

FROM debian:slim-buster
COPY --from=builder /usr/local/cargo/bin/rocket-hello-world /usr/local/bin/rocket-hello-world
CMD ["rocket-hello-world"]