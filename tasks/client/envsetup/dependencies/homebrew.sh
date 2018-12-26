#!/usr/bin/env bash

. ./tasks/common/utils.sh

if [ "$(program_is_installed brew)" == 1 ]; then
    echo "Updating homebrew..."
    brew update
    print_yellow "You may need to brew upgrade if your brew packages are out of date"
    echo_pass "homebrew"
else
    echo_fail "homebrew"
    echo "Installing homebrew..."
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    assert_program_exists brew "homebrew"
    echo "Updating homebrew..."
    brew update
fi
