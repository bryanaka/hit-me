#!/usr/bin/env bash

. ./tasks/common/utils.sh

case "$(uname)" in
    "Linux"*)  ./tasks/client/envsetup/linux.sh   ;;
    "GNU"*)    ./tasks/client/envsetup/linux.sh   ;;
    "Darwin")  ./tasks/client/envsetup/mac-os.sh  ;;
    *) printf "Opps! Couldn't determine your platform from $(uname)"  "Please contact your head engineer for assistance."; exit 1 ;;
esac

exit 0
