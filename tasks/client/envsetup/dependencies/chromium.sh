#!/usr/bin/env bash

. ./tasks/common/utils.sh

# CHROMIUM YUM CONFIG
CHROMIUM_YUM_REPO_URL="http://people.centos.org/hughesjr/chromium/6/chromium-el6.repo"
CHROMIUM_YUM_REPO_OUTPUT="/etc/yum.repos.d/chromium.repo"


if [ "$(program_is_installed chromium-browser)" == 1 ]; then
    echo_pass "Chromium Browser"
else
    echo_fail "Chromium Browser"
    echo "Installing Chromium Browser..."

    if [ "$(program_is_installed yum)" == 1 ]; then
        assert_program_exists wget "wget"
        sudo wget $CHROMIUM_YUM_REPO_URL -O $CHROMIUM_YUM_REPO_OUTPUT
        sudo yum -y install chromium
        assert_program_exists chromium-browser "Chromium Browser"
    elif [ "$(program_is_installed apt-get)" == 1 ]; then
        sudo apt-get update && sudo apt-get -y install chromium-browser
        assert_program_exists chromium-browser "Chromium Browser"
    else
        echo_fail "Chromium Browser"
        print_red "Chromium Browser is required to run tests from the command line."
        print_yellow "It is highly recommened you download the latest Chromium and"
        print_yellow "ensure Chromium is reachable in the command line via 'chromium-browser'"
    fi
fi
