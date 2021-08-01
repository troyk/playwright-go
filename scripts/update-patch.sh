#!/bin/bash

set -e

BRANCH_NAME="playwright-build"
SCRIPTS_DIR="$(dirname "$0")"

echo "Creating patch..."

cd "$SCRIPTS_DIR/../playwright"

git diff --full-index $(git rev-parse HEAD^1)..$(git rev-parse HEAD) > ../patches/main.patch

git reset --hard $(git rev-parse HEAD^1)

cd -