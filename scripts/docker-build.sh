#!/usr/bin/env bash
set -e

cd $(dirname $0)

project_root="${PWD}/../"

docker build -t laterne_ci ${project_root}