#!/usr/bin/env bash

# Configuration Variables
# ==============================================================================

# YARN YUM CONFIG
YARN_YUM_REPO_URL="https://dl.yarnpkg.com/rpm/yarn.repo"
YARN_YUM_REPO_OUTPUT="/etc/yum.repos.d/yarn.repo"
YARN_YUM_NODE_SETUP="https://rpm.nodesource.com/setup_6.x"

# YARN APT GET CONFIG
YARN_APT_KEY_PUBLIC_KEY="https://dl.yarnpkg.com/debian/pubkey.gpg"
YARN_DEB_PKG_URL="https://dl.yarnpkg.com/debian/"
YARN_TEE_SOURCE_LIST="/etc/apt/sources.list.d/yarn.list"

# DEBUGING CONFIG URL
ERROR_URL="https://yarnpkg.com/lang/en/docs/install/#linux-tab"

. ./tasks/common/utils.sh

if [ "$(program_is_installed yarn)" == 1 ]; then
    echo_pass "yarn"
else
    echo_fail "yarn"
    echo "Installing Yarn..."

    if [ "$(program_is_installed yum)" == 1 ]; then
        assert_program_exists wget "wget"
        sudo wget $YARN_YUM_REPO_URL -O $YARN_YUM_REPO_OUTPUT
        curl --silent --location $YARN_YUM_NODE_SETUP | sudo bash -
        sudo yum -y install yarn
        assert_program_exists yarn "yarn"
    elif [ "$(program_is_installed apt-get)" == 1 ]; then
        curl -sS $YARN_APT_KEY_PUBLIC_KEY | sudo apt-key add -
        echo "deb $YARN_DEB_PKG_URL stable main" | sudo tee $YARN_TEE_SOURCE_LIST
        sudo apt-get update && sudo apt-get -y install yarn
        assert_program_exists yarn "yarn"
    else
        echo_fail "yarn"
        print_red "yarn could not install and is required to work on this application."
        echo "please visit $ERROR_URL to debug installing yarn"
        exit 1
    fi
fi
