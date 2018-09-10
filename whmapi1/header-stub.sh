#!/bin/bash
#                                                          +----+----+----+----+
#                                                          |    |    |    |    |
# Author: Mark David Scott Cunningham                      | M  | D  | S  | C  |
#                                                          +----+----+----+----+
# Created: YYYY-MM-DD
# Updated: YYYY-MM-DD
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

_domainList(){
   awk -F: '($1 ~ /[:alphanum:]/) {print $1}' /etc/userdomains
}

_whmapi1(){
local cur prev opts line base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    line="${COMP_LINE}"
    base="${1##*/}"
    opts="--help --output "
    firstWord=$(i=1; while [[ ${COMP_WORDS[i]} == -* ]]; do ((i++)); done; echo ${COMP_WORDS[i]};)

# Parameters and Global Options
case ${prev} in
  user)
    COMPREPLY=( $(compgen -u -- ${cur}) )
    return 0 ;;

  domain*)
    COMPREPLY=( $(compgen -W "$(_domainList)" -- ${cur}) )
    return 0 ;;

  app)
    COMPREPLY=( $(compgen -W "Backups_Home Calendar_Configure ContactInfo_Change Cron_Home Database_MySQL Database_phpMyAdmin Domains_AddonDomains Domains_SubDomains Email_AccountLevelFiltering Email_Accounts Email_Archive Email_Authentication Email_AutoResponders Email_BoxTrapper Email_DefaultAddress Email_DeliveryReport Email_Forwarders Email_GreyListing Email_MailingLists Email_MX Email_SpamFilter Email_UserLevelFiltering FileManager_Home Locale_Change Password_Change Site_Software Stats_AWStats WHMCS_billing" -- ${cur}) )
    return 0 ;;

  service)
    COMPREPLY=( $(compgen -W "cpaneld whostmgrd webmaild" -- ${cur}) )
    return 0 ;;

  provider)
    COMPREPLY=( $(compgen -W "$(whmapi1 --output jsonpretty cpgreylist_load_common_mail_providers_config | grep -A1 '},' | tac | tail -n+2 | awk -F\" '!/^data$/ && !/^metadata$/ && /\"/{print $2}')" -- ${cur}) )
    return 0 ;;

  --output )
    COMPREPLY=( $(compgen -W "json jsonpretty xml yaml" -- ${cur}) )
    return 0 ;;
esac

# Main Commands listed in ${opts}
case ${firstWord} in
