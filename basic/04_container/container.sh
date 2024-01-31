#!/bin/bash

create_container(){
    docker pull nginx
    docker container create -it -p 5000:80 --name=sample-nginx nginx
    docker container start sample-nginx
}