#!/bin/bash

set -u

function missing_arguments() {
    echo "test missing arguments";
    ./change-extension
    local ret=$?
    if [ "$ret" != "1" ]; then
        echo "failed! expected return to be 1.";
    fi
}

function single_arguments() {
    echo "test single arguments";
    ./change-extension "" ""
    local ret=$?
    if [ "$ret" != "1" ]; then
        echo "failed! expected return to be 1.";
    fi
}
missing_arguments
single_arguments
