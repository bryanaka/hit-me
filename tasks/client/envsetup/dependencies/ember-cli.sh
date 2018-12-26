#!/usr/bin/env bash

. ./tasks/common/utils.sh

source_nvm

NVMRC_VERSION="$(cat ./.nvmrc)"
RESOLVED_NODE_VERSION="$(nvm version $NVMRC_VERSION)"

# check ember cli
if [ "$(program_is_installed ember)" == 1 ]; then
    echo_pass "Ember CLI"
else
    echo_fail "Ember CLI"
    echo "Installing Ember CLI..."
    nvm exec $RESOLVED_NODE_VERSION npm install -g ember-cli
    assert_program_exists ember "Ember CLI"
fi
