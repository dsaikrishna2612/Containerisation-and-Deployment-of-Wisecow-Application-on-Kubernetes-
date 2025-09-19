#!/bin/bash
echo "🔍 Application Health Check"

NODE_PORT=$(kubectl get svc wisecow-service -o jsonpath="{.spec.ports[0].nodePort}")
MINIKUBE_IP=$(minikube ip)
STATUS=$(curl -s -o /dev/null -w "%{http_code}" http://$MINIKUBE_IP:$NODE_PORT)

if [ "$STATUS" -eq 200 ]; then
  echo "✅ Wisecow is UP (HTTP 200)"
else
  echo "❌ Wisecow is DOWN (HTTP $STATUS)"
  exit 1
fi
