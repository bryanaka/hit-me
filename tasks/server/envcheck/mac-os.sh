#!/usr/bin/env bash

. ./tasks/common/utils.sh

source_all_the_things

# Configuration Variables
# ==============================================================================
NVMRC_VERSION="$(cat ./.nvmrc)"

# FAILURE INFO URLS
# ------------------------------------------------------------------------------
HOMEBREW_URL="https://brew.sh/"
HOMEBREW_CASK_URL="https://caskroom.github.io"
ELIXIR_INSTALL_URL='https://elixir-lang.org'

# Check Dependencies Script
# ==============================================================================
# Checks the following:
# - homebrew
# - elixir

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

if [ "$(program_is_installed elixir)" == 1 ]; then
  echo_pass "elixir"
else
  echo_fail "elixir - see $ELIXIR_INSTALL_URL"
  ENVCHECK_PASS=1
fi

if [ "$(program_is_installed psql)" == 1 ]; then
  echo_pass "postgresql"
else
  echo ''
  print_yellow 'We could not detect postgres via checking psql, so ensure you have it installed'
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
