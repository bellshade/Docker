#!/bin/bash

checking_os(){
    . /etc/os-release
    case $ID in
        ubuntu) sudo apt install docker docker.io
        ;;
        arch) sudo pacman -S docker
        ;;
        darwin) brew install docker
        ;;
        debian) sudo apt install docker docker.io
        ;;
        *) echo "If windows you can see the documentation"
        ;;
    esac
}

checking_os