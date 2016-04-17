#!/bin/bash
#
# Usage:
#   $ ./build.sh

versions=$(curl https://launchermeta.mojang.com/mc/game/version_manifest.json | jq -r '.versions[] | select(.type=="release") | .id')

for version in $versions;do
    docker build --rm --build-arg MIENCRAFT_VERSION=${version} -t idoitjp/minecraft:${version} .
done
