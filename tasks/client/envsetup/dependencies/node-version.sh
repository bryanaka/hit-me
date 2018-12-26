#!/usr/bin/env bash

. ./tasks/common/utils.sh

source_nvm

NVMRC_VERSION="$(cat ./.nvmrc)"
RESOLVED_NODE_VERSION="$(nvm version $NVMRC_VERSION)"

# installing node version from .nvmrc
nvm use > /dev/null 2>&1
if [ "$(nvm current)" == $RESOLVED_NODE_VERSION ]; then
    echo_pass "Node Version: $NVMRC_VERSION"
else
    echo_fail "Node Version: $NVMRC_VERSION"
    nvm install $NVMRC_VERSION
    nvm use > /dev/null 2>&1

    if [ "$(nvm current)" == "$(nvm version $NVMRC_VERSION)" ]; then
        echo_pass "Node Version: $NVMRC_VERSION"
    else
        print_red "Failed to install Node $NVMRC_VERSION! Please try installing node $NVMRC_VERSION via nvm."
        exit 1
    fi
fi
