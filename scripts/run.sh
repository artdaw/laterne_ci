#!/usr/bin/env bash
set -e

docker exec -it laterne_ci lighthouse --chrome-flags="--headless" --output=json --output-path=stdout --quiet $@ > report.json