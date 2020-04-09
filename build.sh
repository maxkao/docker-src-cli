#!/bin/sh
#
# Usage: build.sh [version]
#
# If version is omitted, fetch the latest from GitHub.
#
set -eo pipefail

readonly REPO=sourcegraph/src-cli
VERSION="$1"
if [ "$VERSION" = "" ] ; then
    VERSION=$(curl --silent "https://api.github.com/repos/$REPO/releases/latest" \
		  | jq -r .tag_name)
fi

echo "-- Building src-cli version $VERSION ..." 1>&2

cd "$(dirname "$0")"
docker build \
       --tag="$REPO":"$VERSION" --target=run \
       --build-arg=SRC_CLI_VERSION="$VERSION" \
       .
