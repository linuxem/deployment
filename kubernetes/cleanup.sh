#!/usr/bin/env bash
kubectl delete -f yaml/core/pipeline-driver.yml
kubectl delete -f yaml/core/webhook-stub-ui.yml
kubectl delete -f yaml/core/api-server.yml
kubectl delete -f yaml/core/worker-green.yml
kubectl delete -f yaml/core/worker-yellow.yml
kubectl delete -f yaml/core/worker-black.yml