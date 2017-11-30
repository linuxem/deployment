#!/usr/bin/env bash

deployments=$(kubectl get deployments -l "scale-group=$1" -o jsonpath='{.items[*].metadata.name}')
for d in $deployments; do
    kubectl scale deployment ${d} --replicas=$2
done
