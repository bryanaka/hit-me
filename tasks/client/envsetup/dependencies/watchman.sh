#!/usr/bin/env bash

. ./tasks/common/utils.sh

if [ "$(program_is_installed watchman)" == 1 ]; then
    echo_pass "watchman"
else
    echo_fail "watchman"
    echo "Installing watchman..."
    brew install watchman
    assert_program_exists watchman "watchman"
fi
