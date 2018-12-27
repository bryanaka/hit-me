#!/usr/bin/env bash

. ./tasks/common/utils.sh

case "$(uname)" in
    "Linux"*)  ./tasks/server/envcheck/linux.sh   ;;
    "GNU"*)    ./tasks/server/envcheck/linux.sh   ;;
    "Darwin")  ./tasks/server/envcheck/mac-os.sh  ;;
    *) printf "Opps! Couldn't determine your platform from $(uname)"  "Please contact your head engineer for assistance."; exit 1 ;;
esac

exit 0
