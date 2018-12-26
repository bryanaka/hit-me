#!/usr/bin/env bash

. ./tasks/common/utils.sh

if [ "$(program_is_installed git)" == 1 ]; then
    echo_pass "git"
else
    echo_fail "git"
    print_red "git is required to work on this application. Please install git."
    exit 1
fi
