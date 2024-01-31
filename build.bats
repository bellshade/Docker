#!/usr/bin/env bats
@test "Testing Image Bellshade" {
    run docker build -t testing-image .
    run docker run testing-image

    [ "$status" -eq 0 ]
    [ "$output" = "Hello Bellshade" ]
}