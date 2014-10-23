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

function format_string() {
    # TODO
}

function reverse_string() {
    # TODO
}

function sort_string() {
    # TODO
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
