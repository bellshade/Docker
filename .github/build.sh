#!/bin/bash

running_test() {
    sudo apt install docker docker.io
    git clone https://github.com/bats-core/bats-core.git
    cd bats-core
    ./install.sh /usr/local

    cd ..
    cd ../example/hello-bellshade/
    bats ../../.gitub/build.bats
}