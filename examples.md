# Usage examples

The examples below assume you have `GITHUB_TOKEN` and `SRC_ACCESS_TOKEN` set in
your environment, where appropriate.

## Upload an LSIF bundle to sourcegraph.com

Assuming the current working directory is a GitHub repository containing an
LSIF index file:

```sh
docker run \
  --rm -it \
  -e SRC_ACCESS_TOKEN=$SRC_ACCESS_TOKEN \
  -v $(pwd):/data \
  -w /data \
  sourcegraph/src-cli:3.11.1 \
  src lsif upload
```
