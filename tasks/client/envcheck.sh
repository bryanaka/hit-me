#!/usr/bin/env bash

. ./tasks/common/utils.sh

case "$(uname)" in
    "Linux"*)  ./tasks/client/envcheck/linux.sh   ;;
    "GNU"*)    ./tasks/client/envcheck/linux.sh   ;;
    "Darwin")  ./tasks/client/envcheck/mac-os.sh  ;;
    *) printf "Opps! Couldn't determine your platform from $(uname)"  "Please contact your head engineer for assistance."; exit 1 ;;
esac

exit 0
