#!/usr/bin/env bash
set -euo pipefail

REGION="us-east-1"
CLUSTER_NAME="brain-tasks-cluster"
K8S_DIR="K8S"

echo "Updating kubeconfig..."
aws eks update-kubeconfig --name "$CLUSTER_NAME" --region "$REGION"

echo "Applying Kubernetes manifests..."
kubectl apply -f "$K8S_DIR/deployment.yml"
kubectl apply -f "$K8S_DIR/service.yml"

echo "Waiting for rollout..."
kubectl rollout status deployment/brain-tasks -n default --timeout=120s || true

echo "Done."
