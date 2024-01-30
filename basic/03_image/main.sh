#!/bin/bash
command=$1

custom_command() {
    case $command in
        "pull") docker pull $2
        ;;
        "list") docker images
        ;;
        "delete") docker rmi $2
        ;;
        *) echo "you can choice pull (command) / list / delete (command)"
    esac
}

custom_command