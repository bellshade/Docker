#!/bin/bash

install_registry(){
    docker pull registry:2
    docker run -d -p 5000:5000 --restart always --name registry registry:2
}

publish_to_registry(){
    docker pull alpine
    docker tag alpine localhost:5000/alpine
    docker push localhost:5000/alpine
}

install_registry
publish_to_registry