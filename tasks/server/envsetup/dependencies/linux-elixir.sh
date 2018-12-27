#!/usr/bin/env bash

ELIXIR_INSTALL_URL='https://elixir-lang.org/install.html#unix-and-unix-like'

. ./tasks/common/utils.sh

if [ "$(program_is_installed elixir)" == 1 ]; then
    echo_pass "elixir"
else
    echo_fail "elixir"
    print_red "elixir is required to work on this application. Please install elixir using instructions at $ELIXIR_INSTALL_URL."
    exit 1
fi
