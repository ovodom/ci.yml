#!/bin/bash
set -e

echo "[1/3] Running tests..."
npm test

echo "[2/3] Running build & deploy..."
./scripts/kind-create-and-deploy.sh

echo "[3/3] Done ✅"
