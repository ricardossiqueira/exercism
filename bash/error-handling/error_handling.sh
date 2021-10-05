#!/usr/bin/env bash

error_handling () {
    if [[ $# != 1 ]]; then
        echo "Usage: error_handling.sh <person>";
        exit 2;
    else
        name=$1;
        echo "Hello, $name";
        exit;
    fi;
}

error_handling "$@"