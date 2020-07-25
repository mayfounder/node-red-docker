#!/bin/bash
export NODE_RED_VERSION=$(grep -oE "\"node-red\": \"(\w*.\w*.\w*.\w*.\w*.)" package.json | cut -d\" -f4)

echo "#########################################################################"
echo "node-red version: ${NODE_RED_VERSION}"
echo "#########################################################################"


 #   --build-arg OS=alpine \
 #   --build-arg UPDATE_REPO="echo Nothing to do" \
 #   --build-arg INSTALL_CMD="apk add --no-cache" \
 #   --file Dockerfile.custom \

docker build --no-cache \
    --build-arg ARCH=arm64v8 \
    --build-arg NODE_VERSION=12 \
    --build-arg NODE_RED_VERSION=${NODE_RED_VERSION} \
    --build-arg BUILD_DATE="$(date +"%Y-%m-%dT%H:%M:%SZ")" \
    --build-arg TAG_SUFFIX=default \
    --build-arg OS=buster-slim \
    --build-arg UPDATE_REPO="apt-get update" \
    --build-arg INSTALL_CMD="apt-get -y install" \
    --file Dockerfile.debian \
    --tag testing:node-red-build .
