#!/usr/bin/env bash

. ./tasks/common/utils.sh

source_all_the_things

# Setup Script
# ==============================================================================
# Installs the following:
# - homebrew
# - nvm
# - node: required version
# - git
# - Ember CLI
# - watchman

assert_program_exists curl "curl"
assert_program_exists ruby "ruby"

# check git
. ./tasks/client/envsetup/dependencies/git.sh

# check homebrew
. ./tasks/client/envsetup/dependencies/homebrew.sh

# installing nvm
. ./tasks/client/envsetup/dependencies/nvm.sh

# installing node version
. ./tasks/client/envsetup/dependencies/node-version.sh

# check yarn
. ./tasks/client/envsetup/dependencies/brew-yarn.sh

# check ember cli
. ./tasks/client/envsetup/dependencies/ember-cli.sh

# check watchman
. ./tasks/client/envsetup/dependencies/watchman.sh

# check chrome
. ./tasks/client/envsetup/dependencies/chrome.sh

# finished prompt
print_green "Congrats! You are ready to start using $APP_NAME!"
