#!/usr/bin/env bash

. ./tasks/common/utils.sh

if [ "$(program_is_installed elixir)" == 1 ]; then
    echo_pass "elixir"
else
    echo_fail "elixir"
    echo "Installing Elixir..."
    brew install elixir
    assert_program_exists elixir "elixir"
fi
