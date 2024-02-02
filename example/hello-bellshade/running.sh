#!/bin/bash

# digunakan untuk building image
docker build -t sample-image .

# digunakan untuk running image
docker run sample-image