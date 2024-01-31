#!/bin/bash

install_compose_in_linux() {
    DESTINATION=/usr/local/bin/docker-compose
    sudo chmod 755 $DESTINATION
    VERSION=$(curl --silent https://api.github.com/repos/docker/compose/releases/latest | grep -Po '"tag_name": "\K.*\d')
    sudo curl -L https://github.com/docker/compose/releases/download/${VERSION}/docker-compose-$(uname -s)-$(uname -m) -o $DESTINATION
}

check_linux(){
    . /etc/os-release
    case $ID in 
        ubuntu) 
        sudo apt install wget curl docker docker.io -y
        ;;
        arch) 
        sudo pacman -S docker wget curl 
        ;;
        debian) 
        sudo apt install wget docker curl docker.io -y
        ;;
    esac
}

checking_os(){
    command=$(uname -s)
    case $command in
        Linux) 
        check_linux
        install_compose_in_linux
        ;;
        Darwin) 
        brew install docker docker-compose wget curl
        ;;
        *) echo "If windows you can see the documentation"
        ;;
    esac
}

checking_os