#
# Build a docker image for the Sourcegraph CLI by fetching the pre-built binary
# from https://github.com/sourcegraph/src-cli and copying it to /usr/bin.
#
# Build:
#   V=3.11.1
#   docker build --target=run --build-arg=SRC_CLI_VERSION=$V --tag=src-cli:$V .
#
# Usage:
#   docker run --rm src-cli:$V src version
#
FROM alpine:latest AS build

ARG SRC_CLI_VERSION=3.11.1
RUN apk add --no-cache curl
RUN curl -LO https://github.com/sourcegraph/src-cli/releases/download/${SRC_CLI_VERSION}/src_linux_amd64
RUN chmod +x src_linux_amd64

FROM alpine:latest AS run
COPY --from=build /src_linux_amd64 /usr/bin/src

