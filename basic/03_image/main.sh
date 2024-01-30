#!/bin/bash
command=$1
flag=$2

custom_command() {
    case $command in
        "pull") docker pull $flag
        ;;
        "list") docker images
        ;;
        "delete") docker rmi $flag
        ;;
        *) echo "you can choice pull (command) / list / delete (command)"
    esac
}

custom_command