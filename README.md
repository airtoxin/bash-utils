bash-utils
==========

bash-utils is utility functions for bash.
These functions wraps complex bash trics.
Encourage your scripting.

##Usage
Add line on your bash script.

```bash
. /path/to/bashutils.sh
```

##Functions
###Conditional functions
These functions returns no string and exit code __0__ or __another numbers__.
It can be use in conditional expression in if-statement.

####equal {ARG1} {ARG2}
If ARG1 and ARG2 is equal, function exit with 0.

`$ equal 'a' 'a'` => 0 (true)

`$ equal 10 10` => 0 (true)

`$ equal '10' 10` => 0 (true)

####not_equal {ARG1} {ARG2}
Negated equal function

`$ not_equal 10 55` => 0 (true)

####nothing {STR}
If STR is empty string '', function exit with 0.

`$ nothing ''` => 0 (true)

`$ nothing '0'` => not 0 (false)

####not_nothing {STR}
Negated nothing function

`$ not_nothing ''` => not 0 (false)

####greater_than {ARG1} {ARG2}
If ARG1 is greater than ARG2, function exit with 0.

`$ greater_than 10 1` => 0 (true)

`$ greater_than '10' 5` => 0 (true)

`$ greater_than 3 3` => not 0 (false)

`$ greater_than -4 -10` => 0 (true)

####greater_than_equal {ARG1} {ARG2}
If ARG1 is equal to ARG2 or ARG1 is greater than ARG2, function exit with 0.

`$ greater_than 10 1` => 0 (true)

`$ greater_than 3 3` => 0 (true)

####less_than {ARG1} {ARG2}
If ARG1 is less than ARG2, function exit with 0.

####less_than_equal {ARG1} {ARG2}
If ARG1 is equal to ARG2 or ARG1 is less than ARG2, function exit with 0.

####exists {PATH}
If file or directory exists in PATH, function exit with 0.

`$ exists /dev` => 0 (true)



###File/Directory path functions
These functions return path string.

####current_directory_name
Return name of working directory.

`$ cd ~ && current_directory_name` => {name of homedirectory}

####current_directory_path
Return full path of current working directory

`$ cd ~ && current_directory_path` => /home/{name of homedirectory}



###String functions
These functions manipulate strings and return processed string.

####format_string {TEMPLATE} {ARGS}...
This function replate from `%s` in TEMPALTE to ARGS in order.

`$ format_string 'your %s is %s' rank 17` => your rank is 17

####reverse_string {STR}
This function reverse STR character by character.

`$ reverse_string test` => tset

####tokenize_string {STR}
This function tokenizes {STR} by {IFS} enviroment variable.
Default IFS is space.

`$ tokenize_string 'hello world'` =>

```
hello
world
```

If you want split your own separator, subshell is good idea.

`echo "$(IFS=\@ tokenize_string 'hello@world')"` returns same above result.

####join_string {SEP} {ARGS}...
This function joins ARGS with SEP.
SEP must be only 1 character.

`$ join_string , this is joined string` => this,is,joined,string.

####split_string {SEP} {STR}
STR split by SEP.
SEP must be only 1 character.

`$ split_string , this,is,splited,string` => this is splited string.



###Control $PATH enviroment functions

####remove_path {PATH}
Remove PATH from $PATH enviroment.

####append_path {PATH}
Add PATH to back of $PATH.

####prepend_path {PATH}
Add PATH to front of $PATH



###Decorated echo functions
These functions print colorized or bolded strings.
Color naming reference is [bootstrap](http://getbootstrap.com/css/)

####echo_primary {STR}
Print STR in blue.

####echo_success {STR}
Print STR in green.

####echo_info {STR}
Print STR in light blue

####echo_warning {STR}
Print STR in yellow.

####echo_danger {STR}
Print STR in red.

####echo_emphasis {STR}
Print bold STR.

####echo_primary_emphasis {STR}
Print bold STR in blue.

####echo_success_emphasis {STR}
Print bold STR in green.

####echo_info_emphasis {STR}
Print bold STR in light blue

####echo_warning_emphasis {STR}
Print bold STR in yellow.

####echo_danger_emphasis {STR}
Print bold STR in red.
