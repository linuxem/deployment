#!/usr/bin/env bash
kubectl apply -f yaml/core/pipeline-driver.yml
kubectl apply -f yaml/core/webhook-stub-ui.yml
kubectl apply -f yaml/core/api-server.yml
kubectl apply -f yaml/core/worker-green.yml
kubectl apply -f yaml/core/worker-yellow.yml
kubectl apply -f yaml/core/worker-black.yml

