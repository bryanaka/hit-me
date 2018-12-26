#!/usr/bin/env bash

# Setup Script functions
# ==============================================================================

function source_nvm {
  [ -z "$NVM_DIR" ] && export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

function source_all_the_things {
  [ -s "~/.bashrc" ] && \. ~/.bashrc
  [ -s "~/.profile" ] && \. ~/.profile
  [ -s "~/.bash_profile" ] && \. ~/.bash_profile
  [ -s "~/.zshrc" ] && \. ~/.zshrc
  source_nvm
}

# return 1 if global command line program installed, else 0
# example
# echo "node: $(program_is_installed node)"
function program_is_installed {
  # set to 1 initially
  local return_=1
  # set to 0 if not found
  command -v $1 >/dev/null 2>&1 || { local return_=0; }
  echo $return_
}

# echo first argument in green
function print_green {
  printf "\e[32m${1}\033[0m\n"
}

# echo first argument in yellow
function print_yellow {
  printf "\e[33m${1}\033[0m\n"
}

# echo first argument in red
function print_red {
  printf "\e[31m${1}\033[0m\n"
}

# display a message in red with a cross by it
function echo_fail {
  print_red "[✘] ${1}"
}

# display a message in green with a tick by it
function echo_pass {
  print_green "[✔] ${1}"
}

function assert_program_exists {
  local program=$1;
  if [ "$(program_is_installed $program)" == 1 ]; then
    echo_pass $2
  else
    print_red "Failed to install ${2}! Please try installing ${2} manually."
    exit 1
  fi
}
