#!/bin/bash

while getopts t:i:e:d:s:f:c: flag
do
    case "${flag}" in
        t|--type) type_image=${OPTARG}
        ;;
        i|--image) custom_image=${OPTARG}
        ;;
        e|--expected) expected_output=${OPTARG}
        ;;
        d|--destination) port_publish=${OPTARG}
        ;;
        s|--source) port_image=${OPTARG}
        ;;
        c|--container) container_name=${OPTARG}
        ;;
        f|--file) file_docker=${OPTARG}
        ;;
    esac
done

app_image_test(){
    check_port=$(docker ps -a | grep -q $port_publish)
    docker build -f $file_docker -t $custom_image  .
    docker run -dp $port_publish:$port_image --name=$container_name $custom_image
    if $check_port; then
        echo $'\nTesting App Image Passed'
        sleep 5s
        docker rm -f $container_name
        docker rmi -f $custom_image
        sleep 5s
        echo $'\nImage & Container Success Delete'
    else
        echo $'\nTesting Failure'
    fi
}

echo_image_test(){
    docker build -t $custom_image .
    output=$(docker run --name=$container_name $custom_image)
    if [ "$output" = "$expected_output" ]; then
        echo $'\nTesting Echo Image Passed'
        sleep 5s
        docker rm -f $container_name
        docker rmi -f $custom_image
        sleep 5s
        echo $'\nImage & Container Success Delete'
    else
        echo $'\nTesting Failure'
    fi
}

choose_test(){
    case $type_image in
        "app") app_image_test
        ;;
        "echo") echo_image_test
        ;;
        *) echo "Lihat dokumentasi"
    esac
}

run_test(){
    choose_test
}

run_test
