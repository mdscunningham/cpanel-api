#!/bin/bash
#                                                          +----+----+----+----+
#                                                          |    |    |    |    |
# Author: Mark David Scott Cunningham                      | M  | D  | S  | C  |
#                                                          +----+----+----+----+
# Created: 2016-06-21
# Updated: 2018-06-11
#
# Purpose: Add bash tab completion to WHM/cPanel command line api utilities
#

#NOTES
# http://www.linuxjournal.com/content/more-using-bash-complete-command
# https://blog.heckel.xyz/2015/03/24/bash-completion-with-sub-commands-and-dynamic-options/
# https://debian-administration.org/article/316/An_introduction_to_bash_completion_part_1
# https://debian-administration.org/article/317/An_introduction_to_bash_completion_part_2

# Multi-level Completion
# http://cement.readthedocs.io/en/latest/examples/bash_auto_completion/
# https://stackoverflow.com/questions/17879322/how-do-i-autocomplete-nested-multi-level-subcommands

_cpapi_boolean(){
  echo "0 1"
}

_cpapi_cpuser(){
  awk -F: '($1 !~ /^nobody$/) {print $1}' /etc/domainusers
}

_cpapi_domainList(){
  grep $username /etc/userdomains | awk -F: '($1 ~ /[:alphanum:]/) {print $1}'
}

_cpapi_dblist(){
  cpapi2 --user $username MysqlFE listdbs | awk -F: '/db:/{print $2}' | sort | uniq
}

_cpapi_dbuserlist(){
  cpapi2 --user $username MysqlFE getdbusers | awk  '/ - /{print $2}' | sort | uniq
}

_cpapi_emailaddress(){
  for x in /home*/$username/mail/*/*/; do
    email=$(echo $x | awk -F/ '{print $(NF-1)"@"$(NF-2)}'); echo $email;
  done
}

_cpapi_emailuser(){
  for x in /home*/$username/mail/*/*/; do
    email=$(echo $x | awk -F/ '{print $(NF-1)}'); echo $email;
  done
}

_cpapi_filterList(){
  cpapi2 --user $username Email filterlist | grep filtername: | cut -d: -f2- | sed 's/^ //g;s/ /%20/g'
}

_cpapi_ftpuser(){
  awk -F'[:@]' '{print $1}' /etc/proftpd/$username
}

_cpapi_langlist(){
  cpapi2 --user $username LangMods langlist | awk '/lang/{print $2}'
}

_cpapi2(){
  local cur prev opts line base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    line="${COMP_LINE}"
    base="${1##*/}"
    opts="--help --output --user "

  # Pull the "firstword" or the first thing with a capital letter in the word
    section=$(for ((i=1;i<=$COMP_CWORD;i++)); do if [[ ${COMP_WORDS[i]} =~ [A-Z] ]]; then echo ${COMP_WORDS[i]}; break; fi; done;)

  # Pull the function name based on the item after the "firstword" or section name
    functionName=$(for ((i=1;i<=$COMP_CWORD;i++)); do if [[ ${COMP_WORDS[i]} =~ [A-Z] ]]; then echo ${COMP_WORDS[i+1]}; break; fi; done;)

  # Pull the username of the current command based on the value after the --user flag
    username=$(for ((i=1;i<=$COMP_CWORD;i++)); do if [[ ${COMP_WORDS[i]} == '--user' ]]; then echo ${COMP_WORDS[i+1]}; fi; done;)

# Parameters and Global Options
case ${prev} in
  --user)
    COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
    return 0 ;;

  --output )
    COMPREPLY=( $(compgen -W "json jsonpretty xml yaml" -- ${cur}) )
    return 0 ;;
esac

# Main Commands listed in ${opts}
case ${section} in
