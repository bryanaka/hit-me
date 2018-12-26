#!/usr/bin/env bash

# Configuration Variables
# ==============================================================================
NVM_VERSION="v0.33.11"
NVM_INSTALL_SCRIPT="https://raw.githubusercontent.com/creationix/nvm/$NVM_VERSION/install.sh"

. ./tasks/common/utils.sh

source_nvm

if [ "$(program_is_installed nvm)" == 1 ]; then
    # check nvm version
    if [ "v$(nvm --version)" == $NVM_VERSION ]; then
        echo_pass "nvm"
        source_nvm
    else
      echo "Updating nvm..."
      CURRENT_WORKING_DIR="$(pwd)"
      cd $NVM_DIR
      git fetch
      git checkout $NVM_VERSION
      source_nvm
      cd $CURRENT_WORKING_DIR
    fi
else
    echo_fail "nvm"
    echo "Installing nvm..."
    curl -o- $NVM_INSTALL_SCRIPT | bash
    source_nvm
    assert_program_exists nvm "nvm"
fi
