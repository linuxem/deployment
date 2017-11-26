#!/usr/bin/env bash
#eval $(minikube docker-env)
export PRIVATE_REGISTRY=registry.gitlab.com/greenapes/hkube/registry
pushd .
source ../repos.sh

for REPO in $REPOS
do
    echo
    echo --- Repository $REPO ---
    echo cd ${WORKSPACE}/${REPO}
    cd ${WORKSPACE}/${REPO}
    npm run build
    echo

done

popd