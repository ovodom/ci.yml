#!/bin/bash
set -e

CLUSTER_NAME="wsl-k8s-demo"

echo "[1/4] Creating KinD cluster (if not exists)..."
if ! kind get clusters | grep -q "$CLUSTER_NAME"; then
  kind create cluster --name "$CLUSTER_NAME"
else
  echo "KinD cluster '$CLUSTER_NAME' already exists."
fi

echo "[2/4] Building Docker image..."
docker build -t wsl-k8s-demo:latest .

echo "[3/4] Loading image into KinD..."
kind load docker-image wsl-k8s-demo:latest --name "$CLUSTER_NAME"

echo "[4/4] Deploying to Kubernetes..."
kubectl apply -f k8s/

echo "✅ Deployment applied. Run 'kubectl get pods' to check status."
