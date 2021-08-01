#!/bin/bash

set -e

BRANCH_NAME="playwright-build"
SCRIPTS_DIR="$(dirname "$0")"

echo "Applying patches..."

pushd "$SCRIPTS_DIR/.."

git submodule update --init

cd playwright

git reset HEAD --hard

if git show-ref -q --heads "$BRANCH_NAME"; then
  git branch -D "$BRANCH_NAME"
fi

git apply --whitespace=nowarn ../patches/*
git add -A
git commit -m "Applied patches"
git checkout -b "$BRANCH_NAME"

popd
