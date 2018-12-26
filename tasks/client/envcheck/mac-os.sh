#!/usr/bin/env bash

. ./tasks/common/utils.sh

source_all_the_things

# Configuration Variables
# ==============================================================================
# NOTE: This only works for regular installs of Google Chrome
CHROME_PATH="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
NVMRC_VERSION="$(cat ./.nvmrc)"

# FAILURE INFO URLS
# ------------------------------------------------------------------------------
HOMEBREW_URL="https://brew.sh/"
HOMEBREW_CASK_URL="https://caskroom.github.io"
NVM_URL="https://github.com/creationix/nvm"
YARN_INSTALL_URL="https://yarnpkg.com/en/docs/install"
EMBER_CLI_URL="https://ember-cli.com/user-guide/"
WATCHMAN_URL="https://facebook.github.io/watchman/"

# Check Dependencies Script
# ==============================================================================
# Checks the following:
# - curl
# - git
# - homebrew
# - nvm
# - Node: required version
# - Ember CLI
# - watchman
# - Chrome

echo ''
echo 'Checking Dependencies for MacOS...'

ENVCHECK_PASS=0

assert_program_exists curl "curl"
assert_program_exists git  "git"

if [ "$(program_is_installed brew)" == 1 ]; then
  echo_pass "homebrew"
else
  echo_fail "homebrew - see $HOMEBREW_URL"
  ENVCHECK_PASS=1
fi

if [ "$(program_is_installed nvm)" == 1 ]; then
  echo_pass "nvm"
  source_nvm

  # installing node version from .nvmrc
  nvm use > /dev/null 2>&1
  RESOLVED_NODE_VERSION="$(echo $NVMRC_VERSION | nvm version)"
  if [ "$(nvm current)" == "$RESOLVED_NODE_VERSION" ] && [ "$(nvm current)" != "system" ]; then
      echo_pass "Node Version: $NVMRC_VERSION"
  else
      echo_fail "Node Version: Expected $NVMRC_VERSION, got $RESOLVED_NODE_VERSION"
      print_red "Please install $NVMRC_VERSION via nvm"
      ENVCHECK_PASS=1
  fi
else
  echo_fail "nvm - see $NVM_URL"
  echo_fail "Node Version: $NVMRC_VERSION - Please install the version specified in the .nvmrc file via nvm"
  ENVCHECK_PASS=1
fi

if [ "$(program_is_installed yarn)" == 1 ]; then
    echo_pass "yarn"
else
    echo_fail "yarn - see $YARN_INSTALL_URL"
    ENVCHECK_PASS=1
fi

if [ "$(program_is_installed ember)" == 1 ]; then
    echo_pass "Ember CLI"
else
    echo_fail "Ember CLI - see $EMBER_CLI_URL"
    ENVCHECK_PASS=1
fi

if [ "$(program_is_installed watchman)" == 1 ]; then
    echo_pass "watchman"
else
    echo_fail "watchman - see $WATCHMAN_URL"
    ENVCHECK_PASS=1
fi

if [ -s "$CHROME_PATH" ]; then
    echo_pass "Chrome"
else
    echo_fail "Chrome - please install Google Chrome Browser to run ember tests via CLI"
    ENVCHECK_PASS=1
fi

# new line for results
echo ''

if [ $ENVCHECK_PASS == 0 ]; then
    print_green "Everything looks good! Your environment must take after the user ;)"
    exit 0
else
    print_red "Looks like you aren't quite ready to get going. Review the messages above to fix environment issues"
    exit 1
fi
