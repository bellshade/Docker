#!/bin/bash

commad=$1

running_command(){
    case $commad in
        "prune") sudo docker system prune
        ;;
        "info") sudo docker system info
        ;;
        "disk") sudo docker system df -v
        ;;
        *) echo "command not found"
        ;;
    esac
}

running_command