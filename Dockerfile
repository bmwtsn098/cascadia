# Build Stage:
FROM golang:1.18

## Install build dependencies.
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential

## Add Source Code
ADD . /cascadia
WORKDIR /cascadia

## Build Step
RUN go mod init cascadia
RUN go mod tidy
RUN go build


# Package Stage
#FROM --platform=linux/amd64 ubuntu:20.04
#COPY --from=builder /fuzzme /