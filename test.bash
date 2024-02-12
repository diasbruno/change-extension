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

function empty_arguments() {
    echo "test empty arguments";
    ./change-extension "" ""
    local ret=$?
    if [ "$ret" != "1" ]; then
        echo "failed! expected return to be 1.";
    fi
}

function change_bash_extension() {
    echo "test change bash extension";
    local output=`./change-extension "sh" "t.bash"`
    local ret=$?
    if [ "$ret" != "0" ] && [ "$output" != "t.sh" ]; then
        echo "failed! expected 't.sh' to be printted";
    fi
}

function dont_allow_empty_extension() {
    echo "test dont allow empty extension";
    ./change-extension "" "t.bash"
    local ret=$?
    if [ "$ret" != "1" ]; then
        echo "failed! expected return to be 1.";
    fi
}

function dont_allow_empty_filename() {
    echo "test dont allow empty filename";
    ./change-extension "sh" ""
    local ret=$?
    if [ "$ret" != "1" ]; then
        echo "failed! expected return to be 1.";
    fi
}

function dont_allow_dot_at_the_end() {
    echo "test dont allow dot at the end";
    ./change-extension "sh" "t."
    local ret=$?
    if [ "$ret" != "1" ]; then
        echo "failed! expected return to be 1.";
    fi
}

missing_arguments
single_arguments
empty_arguments
change_bash_extension
dont_allow_empty_extension
dont_allow_empty_filename
dont_allow_dot_at_the_end
