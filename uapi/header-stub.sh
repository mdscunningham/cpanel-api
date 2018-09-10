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

_uapi_appkey(){
  echo "file_manager images directory_privacy disk_usage web_disk ftp_accounts ftp_connections anonymous_ftp backup backup_wizard version_control file_and_directory_restoration php_my_admin mysql_databases mysql_database_wizard remote_mysql postgresql_databases postgresql_database_wizard php_pg_admin site_publisher addon_domains subdomains aliases redirects email_accounts email_disk_usage forwarders email_routing autoresponders default_address mailing_lists track_delivery global_email_filters email_filters authentication address_importer apache_spam_assassin archive encryption boxtrapper greylisting calendar_and_contacts visitors errors bandwidth raw_access awstats analog_stats webalizer webalizer_ftp metrics_editor cpu_and_concurrent_connection_usage ssh_access ip_blocker ssl_tls hotlink_protection leech_protection security_policy mod_security two_factor_authentication php php_pear_packages perl_modules ruby_gems ruby_on_rails site_software optimize_website multiphp_manager multiphp_ini_editor terminal web_host_manager cron_jobs track_dns indexes error_pages apache_handlers mime_types virus_scanner api_shell change_password change_language change_style contact_information user_manager tls_wizard tls_status application_manager zone_editor cpanel-wordpress-instance-manager configure_mail_client solr_search_index"
}

_uapi_backupID(){
  find /backup*/ -maxdepth 2 -type d | grep -E '[0-9]{4}-[0-9]{2}-[0-9]{2}$' | sed 's|/backup/||g'
}

_uapi_boolean(){
  echo "0 1"
}

_uapi_cpuser(){
  awk -F: '($1 !~ /^nobody$/) {print $1}' /etc/domainusers
}

_uapi_domainList(){
  grep $username /etc/userdomains | awk -F: '($1 ~ /[:alphanum:]/) {print $1}'
}

_uapi_dblist(){
  mysql -NBe 'show databases' | grep ${username:0:8}
}

_uapi_dbuserlist(){
  mysql -NBe 'select user from mysql.user' | grep ${username:0:8} | sort | uniq
}

_uapi_emailaddress(){
  for x in /home*/$username/mail/*/*/; do
    email=$(echo $x | awk -F/ '{print $(NF-1)"@"$(NF-2)}'); echo $email;
  done
}

_uapi_emailuser(){
  for x in /home*/$username/mail/*/*/; do
    email=$(echo $x | awk -F/ '{print $(NF-1)}'); echo $email;
  done
}

_uapi_featureList(){
  uapi --user $username Features list_features | awk -F: '($2 ~ /0|1/) && !/status/ {print $1}'
}

_uapi_ftpuser(){
  awk -F'[:@]' '{print $1}' /etc/proftpd/$username
}

_uapi_marketProvider(){
  uapi --user $username Market get_providers_list | awk -F: '/name:/ {print $NF}'
}

_uapi_phpversion(){
  uapi --user $username LangPHP php_get_installed_versions | awk '/ - /{print $NF}'
}

_uapi(){
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
    COMPREPLY=( $(compgen -W "$(_uapi_cpuser)" -- ${cur}) )
    return 0 ;;

  --output )
    COMPREPLY=( $(compgen -W "json jsonpretty xml yaml" -- ${cur}) )
    return 0 ;;
esac

# Main Commands listed in ${opts}
case ${section} in
