#!/usr/bin/env bash

#################### conditional functions ####################

function equal() {
    test $1 = $2 || test $1 -eq $2 >/dev/null 2>&1
}

function not_equal() {
    test ! $1 = $2 || test ! $1 -eq $2 >/dev/null 2>&1
}

function nothing() {
    test -z $1 >/dev/null 2>&1
}

function not_nothing() {
    test -n $1 >/dev/null 2>&1
}

function greater_than() {
    test $1 -gt $2 >/dev/null 2>&1
}

function greater_than_equal() {
    test $1 -gt $2 || test $1 -eq $2 >/dev/null 2>&1
}

function less_than() {
    test $1 -lt $2 >/dev/null 2>&1
}

function less_than_equal() {
    test $1 -lt $2 || test $1 -eq $2 >/dev/null 2>&1
}

function exists() {
    test -e $1 >/dev/null 2>&1
}





#################### get file/directory path functions ####################

function current_directory_name() {
    basename `pwd`
}

function current_directory_path() {
    pwd
}





#################### manipulate string functions ####################

function format_string() {
    local string=$1
    shift
    printf "${string}\n" ${*}
}

function reverse_string() {
    echo $1 | rev
}

function tokenize_string() {
    local tokens=($1)
    for token in ${tokens[*]}; do
        echo $token
    done
}

function join_string() {
    local separator=$1
    shift
    local arr=("$@")
    echo "$(IFS=${separator} eval 'str="${arr[*]}"' && echo $str)"
}

function split_string() {
    local separator=$1
    shift
    echo "$(IFS=${separator} eval 'str=($@)' && echo ${str[@]})"
}





#################### control $PATH enviroment functions ####################

function remove_path() {
    export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`
}

function append_path() {
    path_remove $1
    export PATH="$PATH:$1"
}

function prepend_path() {
    path_remove $1
    export PATH="$1:$PATH"
}





#################### decorated echo functions ####################

# blue (34)
function echo_primary() {
    echo -e "\033[0;34m${*}\033[0;39m"
}

# green (32)
function echo_success() {
    echo -e "\033[0;32m${*}\033[0;39m"
}

# cyan (36)
function echo_info() {
    echo -e "\033[0;36m${*}\033[0;39m"
}

# yellow (33)
function echo_warning() {
    echo -e "\033[0;33m${*}\033[0;39m"
}

# red (31)
function echo_danger() {
    echo -e "\033[0;31m${*}\033[0;39m"
}

# bold (1)
function echo_emphasis() {
    echo -e "\033[1;30m${*}\033[0;39m"
}

# blue (34) bold (1)
function echo_primary_emphasis() {
    echo -e "\033[1;34m${*}\033[0;39m"
}

# green (32) bold (1)
function echo_success_emphasis() {
    echo -e "\033[1;32m${*}\033[0;39m"
}

# cyan (36) bold (1)
function echo_info_emphasis() {
    echo -e "\033[1;36m${*}\033[0;39m"
}

# yellow (33) bold (1)
function echo_warning_emphasis() {
    echo -e "\033[1;33m${*}\033[0;39m"
}

# red (31) bold (1)
function echo_danger_emphasis() {
    echo -e "\033[1;31m${*}\033[0;39m"
}
