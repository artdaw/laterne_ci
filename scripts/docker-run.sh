#!/usr/bin/env bash
set -e

docker run -dit --rm --name laterne_ci --cap-add=SYS_ADMIN laterne_ci