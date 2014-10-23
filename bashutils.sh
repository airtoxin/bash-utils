#!/usr/bin/env bash

#################### condition functions ####################

# $ equal "hoge" "hoge"; echo $?
# => 0 (true)
function equal() {
    test $1 = $2 || test $1 -eq $2 >/dev/null 2>&1
}

# $ not_equal "hoge" "fuga"; echo $?
# => 0 (true)
function not_equal() {
    test ! $1 = $2 || test ! $1 -eq $2 >/dev/null 2>&1
}

# $ nothing ""; echo $?
# => 0 (true)
function nothing() {
    test -z $1 >/dev/null 2>&1
}

# $ not_nothing "hoge"; echo $?
# => 0 (true)
function not_nothing() {
    test -n $1 >/dev/null 2>&1
}

# $ greater_than 5 1; echo $?
# => 0 (true)
function greater_than() {
    test $1 -gt $2 >/dev/null 2>&1
}

# $ greater_than_equal 9 5; echo $?
# => 0 (true)
# $ greater_than_equal 5 5; echo $?
# => 0 (true)
function greater_than_equal() {
    test $1 -gt $2 || test $1 -eq $2 >/dev/null 2>&1
}

# $ less_than 1 5; echo $?
# => 0 (true)
function less_than() {
    test $1 -lt $2 >/dev/null 2>&1
}

# $ greater_than_equal 1 5; echo $?
# => 0 (true)
# $ greater_than_equal 5 5; echo $?
# => 0 (true)
function less_than_equal() {
    test $1 -lt $2 || test $1 -eq $2 >/dev/null 2>&1
}

# file or directory exists
# $ exists /dev/null; echo $?
# => 0 (true)
# $ exists /; echo $?
# => 0 (true)
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

# $ format_string 'your %s is %s' rank 17
# => your rank is 17
function format_string() {
    local string=$1
    shift
    printf "${string}\n" ${*}
}

# $ reverse_string test
# => tset
function reverse_string() {
    echo $1 | rev
}

# $ tokenize 'hello world'
# => hello
# => world
function tokenize() {
    local tokens=($1)
    for token in ${tokens[*]}; do
        echo $token
    done
}





#################### control $PATH enviroment functions ####################

# remove_path /path
function remove_path() {
    export PATH=`echo -n $PATH | awk -v RS=: -v ORS=: '$0 != "'$1'"' | sed 's/:$//'`
}

# append_path /path
function append_path() {
    path_remove $1
    export PATH="$PATH:$1"
}

# prepend_path /path
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
