#!/bin/bash
#                                                          +----+----+----+----+
#                                                          |    |    |    |    |
# Author: Mark David Scott Cunningham                      | M  | D  | S  | C  |
#                                                          +----+----+----+----+
# Created: 2016-06-21
# Updated: 2018-09-11
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

_countryCodes(){
  whmapi1 get_countries_with_known_ip_ranges | awk '/code:/{print $2}'
}

_cpuser(){
  awk -F: '($1 !~ /^nobody$/) {print $1}' /etc/domainusers
}

_domainList(){
  awk -F: '($1 ~ /[:alphanum:]/) {print $1}' /etc/userdomains
}

_emailaddress(){
  for x in /home*/*/mail/*/*/; do
    email=$(echo $x | awk -F/ '{print $(NF-1)"@"$(NF-2)}'); echo $email;
  done
}

_featureList(){
  whmapi1 getfeaturelist | awk '/id:/{print $2}'
}

_featureListNames(){
  whmapi1 get_featurelists | awk '/ - /{print $2}'
}

_ips(){
  ip -o -4 a | awk '($4 !~ /^127/) {print $4}' | cut -d/ -f1
}

_modsecConfig(){
  whmapi1 modsec_get_configs | awk '/config/{print $2}'
}

_modsecVendor(){
  whmapi1 modsec_get_configs | awk '/vendor_id/{print $2}' | sort | uniq
}

_phpVersion(){
  whmapi1 php_get_installed_versions | awk '/ - /{print $2}'
}

_cpservice(){
  COMPREPLY=( $(compgen -W "ftp exim dovecot cpanel" -- ${cur}) )
}

_whmservice(){
  COMPREPLY=( $(compgen -W "cpaneld whostmgrd webmaild" -- ${cur}) )
}

_systemservice(){
  COMPREPLY=( $(compgen -W "apache_php_fpm cpanel_php_fpm cpdavd cpgreylistd cphulkd crond dnsadmin exim exim-altport ftpd httpd imap ipaliases lmtp mailman mysql named nscd p0f pop postgresql spamassassin sshd rsyslogd" -- ${cur}) )
}

_whmapi1(){
local cur prev opts line base
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    line="${COMP_LINE}"
    base="${1##*/}"
    opts="--help --output $(whmapi1 applist | awk '/ - /{print $NF}')"

    firstWord=$(i=1; while [[ ${COMP_WORDS[i]} == -* ]]; do ((i++)); done; echo ${COMP_WORDS[i]};)
    secondWord=$(i=1; while [[ ${COMP_WORDS[i]} == -* ]]; do ((i++)); done; echo ${COMP_WORDS[i+1]};)

# Common Parameters and Global Options
case ${prev} in
  user|user-[0-9]|username)
    COMPREPLY=( $(compgen -W "$(_cpuser) root" -- ${cur}) )
    return 0 ;;

  domain*)
    COMPREPLY=( $(compgen -W "$(_domainList)" -- ${cur}) )
    return 0 ;;

  app)
    COMPREPLY=( $(compgen -W "Backups_Home Calendar_Configure ContactInfo_Change Cron_Home Database_MySQL Database_phpMyAdmin Domains_AddonDomains Domains_SubDomains Email_AccountLevelFiltering Email_Accounts Email_Archive Email_Authentication Email_AutoResponders Email_BoxTrapper Email_DefaultAddress Email_DeliveryReport Email_Forwarders Email_GreyListing Email_MailingLists Email_MX Email_SpamFilter Email_UserLevelFiltering FileManager_Home Locale_Change Password_Change Site_Software Stats_AWStats WHMCS_billing" -- ${cur}) )
    return 0 ;;

#  service|service_name)
#    COMPREPLY=( $(compgen -W "cpaneld whostmgrd webmaild" -- ${cur}) )
#    return 0 ;;

  pkg|pkgname|package)
    COMPREPLY=( $(compgen -W "$(whmapi1 listpkgs want all | awk '/name/{print $2}')" -- ${cur}) )
    return 0 ;;

#  provider)
#    COMPREPLY=( $(compgen -W "$(whmapi1 --output jsonpretty cpgreylist_load_common_mail_providers_config | grep -A1 '},' | tac | tail -n+2 | awk -F\" '!/^data$/ && !/^metadata$/ && /\"/{print $2}')" -- ${cur}) )
#    return 0 ;;

  --output )
    COMPREPLY=( $(compgen -W "json jsonpretty xml yaml" -- ${cur}) )
    return 0 ;;
esac

# Main Commands listed in ${opts}
case ${firstWord} in
  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+abort_transfer_session
  abort_transfer_session )
    COMPREPLY=( $(compgen -W "transfer_session_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+accesshash
  accesshash )
    COMPREPLY=( $(compgen -W "user generate" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+accountsummary
  accountsummary )
    COMPREPLY=( $(compgen -W "user domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+acctcounts
  acctcounts )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+add_configclusterserver
  add_configclusterserver )
    COMPREPLY=( $(compgen -W "name user key" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+adddns
  adddns )
    COMPREPLY=( $(compgen -W "domain ip template trueowner" -- ${cur}) )
    case ${prev} in
      ip )
        COMPREPLY=( $(compgen -W "$(_ips)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addips
  addips )
    COMPREPLY=( $(compgen -W "ips netmask excludes" -- ${cur}) )
    case ${prev} in
      netmask )
        COMPREPLY=( $(compgen -W "255.255.{255..240}.0" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+add_override_features_for_user
  add_override_features_for_user )
    COMPREPLY=( $(compgen -W "user features" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addpkg
  addpkg )
    COMPREPLY=( $(compgen -W "name featurelist quota ip frontpage cpmod language maxftp maxsql maxpop maxlist maxsub maxpark maxaddon hasshell bwlimit max_emailacct_quota MAX_EMAIL_PER_HOUR MAX_DEFER_EMAIL_PERCENTAGE digestauth _PACKAGE_EXTENSIONS" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addpkgext
  addpkgext )
    COMPREPLY=( $(compgen -W "name _PACKAGE_EXTENSIONS" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addzonerecord
  addzonerecord )
    COMPREPLY=( $(compgen -W "domain name class ttl type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "A AAAA ASFDB CAA CNAME DNAME DS HINFO LOC MX NS PTR RP SOA SRV SSHFP TXT" -- ${cur}) )
        return 0 ;;
      class )
        COMPREPLY=( $(compgen -W "IN" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_autossl_user_excluded_domains )
    COMPREPLY=( $(compgen -W "username domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+analyze_transfer_session_remote
  analyze_transfer_session_remote )
    COMPREPLY=( $(compgen -W "transfer_session_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_create
  api_token_create )
    COMPREPLY=( $(compgen -W "token_name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_list
  api_token_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_revoke
  api_token_revoke )
    COMPREPLY=( $(compgen -W "token_name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_update
  api_token_update )
    COMPREPLY=( $(compgen -W "token_name new_name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+applist
  applist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+authorizesshkey
  authorizesshkey )
    COMPREPLY=( $(compgen -W "file text user authorize options" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+available_transfer_modules
  available_transfer_modules )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+background_mysql_upgrade_status
  background_mysql_upgrade_status )
    COMPREPLY=( $(compgen -W "upgrade_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_config_get
  backup_config_get )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_config_set
  backup_config_set )
    COMPREPLY=( $(compgen -W "backup_daily_enable backup_daily_retention backup_monthly_dates backup_monthly_enable backup_monthly_retention backup_weekly_day backup_weekly_enable backup_weekly_retention backupaccts backupbwdata backupdays backupdir backupenable backupfiles backuplogs backupmount backupsuspendedaccts backuptype check_min_free_space disable_metadata errorthreshhold force_prune_daily force_prune_monthly force_prune_weekly gziprsyncopts keeplocal linkdest localzonesonly maximum_restore_timeout maximum_timeout min_free_space min_free_space_unit mysqlbackup postbackup prebackup psqlbackup dieifnotmounted usebinarypkgacct" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_date_list
  backup_date_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_add
  backup_destination_add )
    COMPREPLY=( $(compgen -W "name type disabled upload_system_backup" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_delete
  backup_destination_delete )
    COMPREPLY=( $(compgen -W "id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_get
  backup_destination_get )
    COMPREPLY=( $(compgen -W "id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_list
  backup_destination_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_set
  backup_destination_set )
    COMPREPLY=( $(compgen -W "id name type disabled disable_reason upload_system_backup" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_validate
  backup_destination_validate )
    COMPREPLY=( $(compgen -W "id disableonfail" -- ${cur}) )
    return 0 ;;

  backup_does_client_id_have_google_credentials )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  backup_generate_google_oauth_uri )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_set_list
  backup_set_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_skip_users_all
  backup_skip_users_all )
    COMPREPLY=( $(compgen -W "state backupversion" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_skip_users_all_status
  backup_skip_users_all_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_user_list
  backup_user_list )
    COMPREPLY=( $(compgen -W "restore_point" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+batch
  batch )
    COMPREPLY=( $(compgen -W "command" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+changepackage
  changepackage )
    COMPREPLY=( $(compgen -W "user pkg" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+check_remote_ssh_connection
  check_remote_ssh_connection )
    COMPREPLY=( $(compgen -W "host port" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+configurebackgroundprocesskiller
  configurebackgroundprocesskiller )
    COMPREPLY=( $(compgen -W "processes_to_kill trusted_users" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+configureservice
  configureservice )
    COMPREPLY=( $(compgen -W "service enabled monitored exim-altportnum" -- ${cur}) )
    case ${prev} in
       service )
        _systemservice
        return 0 ;;
       enabled|monitored )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_fetch_conversion_details
  convert_addon_fetch_conversion_details )
    COMPREPLY=( $(compgen -W "job_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_fetch_domain_details
  convert_addon_fetch_domain_details )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_get_conversion_status
  convert_addon_get_conversion_status )
    COMPREPLY=( $(compgen -W "job_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_initiate_conversion
  convert_addon_initiate_conversion )
    COMPREPLY=( $(compgen -W "username domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_list_addon_domains
  convert_addon_list_addon_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_list_conversions
  convert_addon_list_conversions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+convert_all_domains_to_fpm
  convert_all_domains_to_fpm )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+convert_and_migrate_from_legacy_config
  convert_and_migrate_from_legacy_config )
    COMPREPLY=( $(compgen -W "no_convert" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+convertopensshtoputty
  convertopensshtoputty )
    COMPREPLY=( $(compgen -W "user file passphrase keep_file" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cors_proxy_get
  cors_proxy_get )
    COMPREPLY=( $(compgen -W "url" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_is_server_netblock_trusted
  cpgreylist_is_server_netblock_trusted )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_list_entries_for_common_mail_provider
  cpgreylist_list_entries_for_common_mail_provider )
    COMPREPLY=( $(compgen -W "provider" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_load_common_mail_providers_config
  cpgreylist_load_common_mail_providers_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_save_common_mail_providers_config
  cpgreylist_save_common_mail_providers_config )
    COMPREPLY=( $(compgen -W "autotrust_new_common_mail_providers provider_key" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_status
  cpgreylist_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_trust_entries_for_common_mail_provider
  cpgreylist_trust_entries_for_common_mail_provider )
    COMPREPLY=( $(compgen -W "provider" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_untrust_entries_for_common_mail_provider
  cpgreylist_untrust_entries_for_common_mail_provider )
    COMPREPLY=( $(compgen -W "provider" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cphulk_status
  cphulk_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+createacct
  createacct )
    COMPREPLY=( $(compgen -W "username domain plan pkgname savepkg featurelist quota password ip cgi spamassassin frontpage hasshell contactemail cpmod maxftp maxsql maxpop maxlst maxsub maxpark maxaddon bwlimit customip language useregns hasuseregns reseller forcedns mailbox_format mxcheck max_email_per_hour max_emailacct_quota max_defer_fail_percentage uid gid homedir dkim spf owner" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_cpgreylist_trusted_host
  create_cpgreylist_trusted_host )
    COMPREPLY=( $(compgen -W "ip comment" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_cphulk_record
  create_cphulk_record )
    COMPREPLY=( $(compgen -W "list_name ip comment" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_featurelist
  create_featurelist )
    COMPREPLY=( $(compgen -W "featurelist feature name overwrite" -- ${cur}) )
    case ${prev} in
      feature)
        COMPREPLY=( $(compgen -W "$(_featureList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_integration_group
  create_integration_group )
    COMPREPLY=( $(compgen -W "user group_id label order" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_integration_link
  create_integration_link )
    COMPREPLY=( $(compgen -W "user app token implements label autologin_token_url url base64_png_image subscriber_unique_id order group_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_remote_root_transfer_session
  create_remote_root_transfer_session )
    COMPREPLY=( $(compgen -W "host port user password root_escalation_method root_password sshkey_name sshkey_passphrase transfer_threads restore_threads unrestricted_restore copy_reseller_privs compressed unencrypted use_backups low_priority enable_custom_pkgacct sphera_user sphera_password sphera_host" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_remote_user_transfer_session
  create_remote_user_transfer_session )
    COMPREPLY=( $(compgen -W "host password unrestricted_restore permit_ftp_fallback" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_user_session
  create_user_session )
    COMPREPLY=( $(compgen -W "user service locale app" -- ${cur}) )
    case ${prev} in
      service  )
        _whmservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+current_mysql_version
  current_mysql_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_account_archives
  delete_account_archives )
    COMPREPLY=( $(compgen -W "user mountpoint" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_configclusterserver
  delete_configclusterserver )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_cpgreylist_trusted_host
  delete_cpgreylist_trusted_host )
    COMPREPLY=( $(compgen -W "ip" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_cphulk_record
  delete_cphulk_record )
    COMPREPLY=( $(compgen -W "list_name ip ip-1 ip-2 ip-3 ip-4 ip-5 ip-6 ip-7 ip-8 ip-9" -- ${cur}) )
    case ${prev} in
      list_name )
        COMPREPLY=( $(compgen -W "black white" -- ${cur}) )
        return 0 ;;
      ip* )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_featurelist
  delete_featurelist )
    COMPREPLY=( $(compgen -W "featurelist" -- ${cur}) )
    case ${prev} in
      featurelist)
        COMPREPLY=( $(compgen -W "$(_featureListNames)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_hook
  delete_hook )
    COMPREPLY=( $(compgen -W "id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_rpm_version
  delete_rpm_version )
    COMPREPLY=( $(compgen -W "section key value" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+deletesshkey
  deletesshkey )
    COMPREPLY=( $(compgen -W "user file leave_authorized" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delip
  delip )
    COMPREPLY=( $(compgen -W "ip netmask skipifshutdown" -- ${cur}) )
    case ${prev} in
      ip )
        COMPREPLY=( $(compgen -W "$(_ips)" -- ${cur}) )
        return 0 ;;
      netmask )
        COMPREPLY=( $(compgen -W "255.255.{255..230}.0" -- ${cur}) )
        return 0 ;;
      skipifshutdown )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delpkgext
  delpkgext )
    COMPREPLY=( $(compgen -W "name _DELETE_EXTENSIONS" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_authentication_provider
  disable_authentication_provider )
    COMPREPLY=( $(compgen -W "service_name provider_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_autossl
  disable_autossl )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_cpgreylist
  disable_cpgreylist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_cphulk
  disable_cphulk )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_failing_authentication_providers
  disable_failing_authentication_providers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_mail_sni
  disable_mail_sni )
    COMPREPLY=( $(compgen -W "domain domain-1 domain-2 domain-3 domain-4 domain-6 domain-6 domain-7 domain-8 domain-9" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_market_provider
  disable_market_provider )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+domainuserdata
  domainuserdata )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+dumpzone
  dumpzone )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_get_currently_installed_packages
  ea4_get_currently_installed_packages )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_get_ea_pkgs_state
  ea4_get_ea_pkgs_state )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  ea4_get_migration_log )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_list_profiles
  ea4_list_profiles )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_migration
  ea4_migration )
    COMPREPLY=( $(compgen -W "revert" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_pre_migrate_check
  ea4_pre_migrate_check )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_recommendations
  ea4_recommendations )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_save_profile
  ea4_save_profile )
    COMPREPLY=( $(compgen -W "filename name pkg desc version tag overwrite" -- ${cur}) )
    case ${prev} in
      pkg )
        COMPREPLY=( $(compgen -W "$(yum search ea- | awk -F: '/^ea-.*:/ {print $1}' | cut -d\. -f1)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+edit_hook
  edit_hook )
    COMPREPLY=( $(compgen -W "id enabled description notes" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+editpkg
  editpkg )
    COMPREPLY=( $(compgen -W "name featurelist quota ip cgi frontpage cpmod language max_emailacct_quota maxftp maxsql maxpop maxlists maxsub maxpark maxaddon hasshell bwlimit max_email_per_hour max_defer_fail_percentage digestauth _PACKAGE_EXTENSIONS" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+editquota
  editquota )
    COMPREPLY=( $(compgen -W "user quota" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+edit_rpm_version
  edit_rpm_version )
    COMPREPLY=( $(compgen -W "section key value" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+editzonerecord
  editzonerecord )
    COMPREPLY=( $(compgen -W "domain line name class ttl type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "A AAAA ASFDB CAA CNAME DNAME DS HINFO LOC MX NS PTR RP SOA SRV SSHFP TXT" -- ${cur}) )
        return 0 ;;
      class )
        COMPREPLY=( $(compgen -W "IN" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+emailtrack_search
  emailtrack_search )
    COMPREPLY=( $(compgen -W "nosize defer failure inprogress deliverytype max_results_by_type" -- ${cur}) )
    case ${prev} in
        nosize|defer|failure|inprogress)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
      deliverytype )
        COMPREPLY=( $(compgen -W "all local remote" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+emailtrack_stats
  emailtrack_stats )
    COMPREPLY=( $(compgen -W "records starttime endtime deliverytype nosuccess nosize" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+emailtrack_user_stats
  emailtrack_user_stats )
    COMPREPLY=( $(compgen -W "records starttime endtime deliverytype" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_authentication_provider
  enable_authentication_provider )
    COMPREPLY=( $(compgen -W "service_name provider_id" -- ${cur}) )
    case ${prev} in
      service_name)
        _whmservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_cpgreylist
  enable_cpgreylist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_cphulk
  enable_cphulk )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_mail_sni
  enable_mail_sni )
    COMPREPLY=( $(compgen -W "domain domain-1 domain-2 domain-3 domain-4 domain-6 domain-6 domain-7 domain-8 domain-9" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_market_provider
  enable_market_provider )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_monitor_all_enabled_services
  enable_monitor_all_enabled_services )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enqueue_transfer_item
  enqueue_transfer_item )
    COMPREPLY=( $(compgen -W "transfer_session_id module size" -- ${cur}) )
    case ${prev} in
      module )
        COMPREPLY=( $(compgen -W "LegacyAccountBackup FeatureListRemoteRoot PackageRemoteRoot AccountLocal AccountRemoteRoot AccountRemoteUser" -- ${cur}) )
        case ${prev} in
          AccountLocal|AccountRemoteRoot)
            COMPREPLY=( $(compgen -W "user localuser detected_remote_user domain ip customip replaceip reseller force overwrite_sameowner_dbs overwrite_sameowner_dbusers skiphomedir shared_mysql_server skipres skipacctdb skipbwdata skipaccount xferpoint" -- ${cur}) )
            return 0 ;;
          FeatureListRoot )
            COMPREPLY=( $(compgen -W "featurelist" -- ${cur}) )
            return 0 ;;
          LegacyAccountBackup )
            COMPREPLY=( $(compgen -W "user restoretype restoreall restoreip restoremail restoremysql restorebwdata restoresubs unrestricted_restore overwrite_all_dbs overwrite_sameowner_dbs overwrite_sameowner_dbusers mysql_dbs_to_restore pgsql_dbs_to_restore" -- ${cur}) )
            return 0 ;;
          PackageRemoteRoot )
            COMPREPLY=( $(compgen -W "package" -- ${cur}) )
            return 0 ;;
        esac
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+exim_configuration_check
  exim_configuration_check )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+expunge_mailbox_messages
  expunge_mailbox_messages )
    COMPREPLY=( $(compgen -W "account mailbox query" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+expunge_messages_for_mailbox_guid
  expunge_messages_for_mailbox_guid )
    COMPREPLY=( $(compgen -W "account mailbox_guid query" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetchcrtinfo
  fetchcrtinfo )
    COMPREPLY=( $(compgen -W "user id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_mail_queue
  fetch_mail_queue )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_service_ssl_components
  fetch_service_ssl_components )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_ssl_certificates_for_fqdns
  fetch_ssl_certificates_for_fqdns )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetchsslinfo
  fetchsslinfo )
    COMPREPLY=( $(compgen -W "domain crtdata" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_ssl_vhosts
  fetch_ssl_vhosts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_transfer_session_log
  fetch_transfer_session_log )
    COMPREPLY=( $(compgen -W "transfer_session_id logfile" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_vhost_ssl_components
  fetch_vhost_ssl_components )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+flush_cphulk_login_history
  flush_cphulk_login_history )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+flush_cphulk_login_history_for_ips
  flush_cphulk_login_history_for_ips )
    COMPREPLY=( $(compgen -W "ip" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+forcepasswordchange
  forcepasswordchange )
    COMPREPLY=( $(compgen -W "users_json stop_on_failure" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generate_cpanel_plugin
  generate_cpanel_plugin )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generate_mobileconfig
  generate_mobileconfig )
    COMPREPLY=( $(compgen -W "account use_ssl" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generatesshkeypair
  generatesshkeypair )
    COMPREPLY=( $(compgen -W "user passphrase name bits algorithm abort_on_existing_key comment" -- ${cur}) )
    case ${prev} in
      bits )
        COMPREPLY=( $(compgen -W "1024 2048 4096" -- ${cur}) )
        return 0 ;;
      algorithm )
        COMPREPLY=( $(compgen -W "rsa2 dsa" -- ${cur}) )
        return 0 ;;
      abort_on_existing_key )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generatessl
  generatessl )
    COMPREPLY=( $(compgen -W "domains countryName stateOrProvinceName localityName organizationName organizationalUnitName emailAddress pass keysize skip_certificate " -- ${cur}) )
    case ${prev} in
      countryName )
        COMPREPLY=( $(compgen -W "$(_countryCodes)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_adjusted_market_providers_products
  get_adjusted_market_providers_products )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_all_contact_importances
  get_all_contact_importances )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_appconfig_application_list
  get_appconfig_application_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_application_contact_event_importance
  get_application_contact_event_importance )
    COMPREPLY=( $(compgen -W "app event" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_application_contact_importance
  get_application_contact_importance )
    COMPREPLY=( $(compgen -W "app" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_check_schedule
  get_autossl_check_schedule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_log
  get_autossl_log )
    COMPREPLY=( $(compgen -W "start_time" -- ${cur}) )
    case ${prev} in
      start_time)
        COMPREPLY=( $(compgen -W "$(whmapi1 get_autossl_logs_catalog | awk '/start_time/{print $NF}')" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_logs_catalog
  get_autossl_logs_catalog )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_autossl_metadata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_pending_queue
  get_autossl_pending_queue )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_pending_queue_for_domain
  get_autossl_pending_queue_for_domain )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_pending_queue_for_user
  get_autossl_pending_queue_for_user )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_problems_for_domain
  get_autossl_problems_for_domain )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_problems_for_user
  get_autossl_problems_for_user )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_providers
  get_autossl_providers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_autossl_user_excluded_domains )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_available_authentication_providers
  get_available_authentication_providers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_available_featurelists
  get_available_featurelists )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_available_tiers
  get_available_tiers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_best_ssldomain_for_service
  get_best_ssldomain_for_service )
    COMPREPLY=( $(compgen -W "service" -- ${cur}) )
    case ${prev} in
      service )
        _cpservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_countries_with_known_ip_ranges
  get_countries_with_known_ip_ranges )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_cphulk_brutes
  get_cphulk_brutes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_cphulk_excessive_brutes
  get_cphulk_excessive_brutes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_cphulk_failed_logins
  get_cphulk_failed_logins )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_cphulk_user_brutes
  get_cphulk_user_brutes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_current_lts_expiration_status
  get_current_lts_expiration_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getdiskusage
  getdiskusage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_domain_info
  get_domain_info )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getfeaturelist
  getfeaturelist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_featurelist_data
  get_featurelist_data )
    COMPREPLY=( $(compgen -W "featurelist" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_featurelists
  get_featurelists )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_feature_metadata
  get_feature_metadata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_feature_names
  get_feature_names )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_fpm_count_and_utilization
  get_fpm_count_and_utilization )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+gethostname
  gethostname )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_integration_link_user_config
  get_integration_link_user_config )
    COMPREPLY=( $(compgen -W "user app" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_login_url
  get_login_url )
    COMPREPLY=( $(compgen -W "provider url_after_login" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getlongtermsupport
  getlongtermsupport )
    COMPREPLY=( $(compgen -W "all" -- ${cur}) )
    case ${prev} in
      all)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_lts_wexpire
  get_lts_wexpire )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_mailbox_status
  get_mailbox_status )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account)
        COMPREPLY=( $(compgen -W "$(_emailaddress; _cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_mailbox_status_list
  get_mailbox_status_list )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account)
        COMPREPLY=( $(compgen -W "$(_emailaddress; _cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_market_providers_commission_config
  get_market_providers_commission_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_market_providers_list
  get_market_providers_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_market_providers_product_metadata
  get_market_providers_product_metadata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_market_providers_products
  get_market_providers_products )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_nameserver_config
  get_nameserver_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_password_strength
  get_password_strength )
    COMPREPLY=( $(compgen -W "password" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+_getpkgextensionform
  _getpkgextensionform )
    COMPREPLY=( $(compgen -W "pkg" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getpkginfo
  getpkginfo )
    COMPREPLY=( $(compgen -W "pkg" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_provider_client_configurations
  get_provider_client_configurations )
    COMPREPLY=( $(compgen -W "service_name provider_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_provider_configuration_fields
  get_provider_configuration_fields )
    COMPREPLY=( $(compgen -W "service_name provider_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_provider_display_configurations
  get_provider_display_configurations )
    COMPREPLY=( $(compgen -W "provider_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_public_contact
  get_public_contact )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_public_ip
  get_public_ip )
    COMPREPLY=( $(compgen -W "ip" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_remote_access_hash
  get_remote_access_hash )
    COMPREPLY=( $(compgen -W "username generate password host" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getresellerips
  getresellerips )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_rpm_version_data
  get_rpm_version_data )
    COMPREPLY=( $(compgen -W "section key" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_service_config
  get_service_config )
    COMPREPLY=( $(compgen -W "service" -- ${cur}) )
    case ${prev} in
      service)
        COMPREPLY=( $(compgen -W "dovecot" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_service_config_key
  get_service_config_key )
    COMPREPLY=( $(compgen -W "service key" -- ${cur}) )
    case ${prev} in
      service)
        COMPREPLY=( $(compgen -W "dovecot" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_shared_ip
  get_shared_ip )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_transfer_session_state
  get_transfer_session_state )
    COMPREPLY=( $(compgen -W "transfer_session_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_tweaksetting
  get_tweaksetting )
    COMPREPLY=( $(compgen -W "key module" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_update_availability
  get_update_availability )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_user_email_forward_destination
  get_user_email_forward_destination )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user)
        COMPREPLY=( $(compgen -W "$(_emailaddress; _cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_authn_linked_accounts
  get_users_authn_linked_accounts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_features_settings
  get_users_features_settings )
    COMPREPLY=( $(compgen -W "user user-{1..9} feature feature-{1..9}" -- ${cur}) )
    case ${prev} in
      feature*)
        COMPREPLY=( $(compgen -W "$(_featureList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_links
  get_users_links )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_with_backup_metadata
  get_users_with_backup_metadata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getzonerecord
  getzonerecord )
    COMPREPLY=( $(compgen -W "domain line" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+has_digest_auth
  has_digest_auth )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+has_mycnf_for_cpuser
  has_mycnf_for_cpuser )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+hold_outgoing_email
  hold_outgoing_email )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+importsshkey
  importsshkey )
    COMPREPLY=( $(compgen -W "user name key extract_public extract_private passphrase" -- ${cur}) )
    case ${prev} in
      extract_public|extract_private)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+installable_mysql_versions
  installable_mysql_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+installed_versions
  installed_versions )
    COMPREPLY=( $(compgen -W "packages" -- ${cur}) )
    case ${prev} in
      packages)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+install_rpm_plugin
  install_rpm_plugin )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+install_service_ssl_certificate
  install_service_ssl_certificate )
    COMPREPLY=( $(compgen -W "service crt key cabundle" -- ${cur}) )
    case ${prev} in
      service)
        _cpservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+installssl
  installssl )
    COMPREPLY=( $(compgen -W "domain crt key cab ip enable_sni_for_mail" -- ${cur}) )
    case ${prev} in
      enable_sni_for_mail)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_disable_account
  ipv6_disable_account )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_enable_account
  ipv6_enable_account )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_add
  ipv6_range_add )
    COMPREPLY=( $(compgen -W "range name enabled" -- ${cur}) )
    case ${prev} in
      enabled)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_edit
  ipv6_range_edit )
    COMPREPLY=( $(compgen -W "name new_name note" -- ${cur}) )
    case ${prev} in
      name)
        COMPREPLY=( $(compgen -W "whmapi1 ipv6_range_list | awk '/name/{print $2}'" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_list
  ipv6_range_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_remove
  ipv6_range_remove )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name)
        COMPREPLY=( $(compgen -W "whmapi1 ipv6_range_list | awk '/name/{print $2}'" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_usage
  ipv6_range_usage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    case ${prev} in
      name)
        COMPREPLY=( $(compgen -W "whmapi1 ipv6_range_list | awk '/name/{print $2}'" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+is_conversion_in_progress
  is_conversion_in_progress )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+is_sni_supported
  is_sni_supported )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+killdns
  killdns )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+killpkg
  killpkg )
    COMPREPLY=( $(compgen -W "pkgname" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+latest_available_mysql_version
  latest_available_mysql_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+limitbw
  limitbw )
    COMPREPLY=( $(compgen -W "user bwlimit" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+link_user_authn_provider
  link_user_authn_provider )
    COMPREPLY=( $(compgen -W "username provider_id subject_unique_identifier preferred_username" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listaccts
  listaccts )
    COMPREPLY=( $(compgen -W "searchtype search searchmethod want" -- ${cur}) )
    case ${prev} in
      searchtype )
        COMPREPLY=( $(compgen -W "domain owner user ip package" -- ${cur}) )
        return 0 ;;
      searchmethod )
        COMPREPLY=( $(compgen -W "exact regex" -- ${cur}) )
        return 0 ;;
      want )
        COMPREPLY=( $(compgen -W "acct backup disklimit diskused domain email inodesused inodeslimit ip ipv6 is_locked legacy_backup mailbox_format max_defer_fail_percentage max_emailacct_quota max_email_per_hour maxaddons maxftp maxlst maxparked maxpop maxsql maxsub min_defer_fail_to_trigger_protection outgoing_mail_suspended outgoing_mail_hold owner partition plan shell startdate suspended suspendreason suspendtime theme temporary unix_startdate user" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listacls
  listacls )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_configclusterservers
  list_configclusterservers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_cparchive_files
  list_cparchive_files )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listcrts
  listcrts )
    COMPREPLY=( $(compgen -W "user registered" -- ${cur}) )
    case ${prev} in
      registered)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_databases
  list_databases )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_database_users
  list_database_users )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_hooks
  list_hooks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_integration_groups
  list_integration_groups )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_integration_links
  list_integration_links )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listips
  listips )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listlockedaccounts
  listlockedaccounts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listmxs
  listmxs )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++list_mysql_databases_and_users
  list_mysql_databases_and_users )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listpkgs
  listpkgs )
    COMPREPLY=( $(compgen -W "want" -- ${cur}) )
    case ${prev} in
      want)
        COMPREPLY=( $(compgen -W "all creatable editable viewable" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_pops_for
  list_pops_for )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listresellers
  listresellers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_rpms
  list_rpms )
    COMPREPLY=( $(compgen -W "target" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listsshkeys
  listsshkeys )
    COMPREPLY=( $(compgen -W "user files public private public_texts private_text extract_private" -- ${cur}) )
    case ${prev} in
      public|private|public_texts|private_text|extract_private )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_styles
  list_styles )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listsuspended
  listsuspended )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_users
  list_users )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listzones
  listzones )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+loadavg
  loadavg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+load_cpgreylist_config
  load_cpgreylist_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+load_cphulk_config
  load_cphulk_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+load_style
  load_style )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+lookupnsip
  lookupnsip )
    COMPREPLY=( $(compgen -W "host" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+lookupnsips
  lookupnsips )
    COMPREPLY=( $(compgen -W "host" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+mail_sni_status
  mail_sni_status )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+manage_features
  manage_features )
    COMPREPLY=( $(compgen -W "action features" -- ${cur}) )
    case ${prev} in
      action)
        COMPREPLY=( $(compgen -W "info list enable disable" -- ${cur}) )
        return 0 ;;
      features)
        COMPREPLY=( $(compgen -W "$(_featureList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+matchpkgs
  matchpkgs )
    COMPREPLY=( $(compgen -W "MAXSUB MAXADDON MAX_DEFER_FAIL_PERCENTAGE MAX_EMAILACCT_QUOTA _PACKAGE_EXTENSIONS CPMOD MAX_EMAIL_PER_HOUR LANG MAXLST MAXPARK MAXSQL FEATURELIST CGI MAXFTP BWLIMIT QUOTA DIGESTAUTH IP" -- ${cur}) )
    case ${prev} in
      CGI)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
      DIGESTAUTH)
        COMPREPLY=( $(compgen -W "y n" -- ${cur}) )
        return 0 ;;
      IP)
        COMPREPLY=( $(compgen -W "y n" -- ${cur}) )
        return 0 ;;
      FEATURELIST)
        COMPREPLY=( $(compgen -W "$(_featureListNames)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modifyacct
  modifyacct )
    COMPREPLY=( $(compgen -W "user BACKUP BWLIMIT contactemail DNS HASCGI HASDKIM HASSHELL HASSPF LOCALE MAXADDON MAXFTP MAXLST MAXPARK MAXPASSENGERAPPS MAXPOP MAXSQL MAXSUB MAX_EMAIL_PER_HOUR MAX_EMAILACCT_QUOTA MAX_DEFER_FAIL_PERCENTAGE newuser owner QUOTA remove_missing_extensions rename_database_objects shell spamassassin frontpage RS DBOWNER DISK_BLOCK_LIMIT IP LANG MAILBOX_FORMAT MXCHECK-DOMAINNAME OUTGOING_EMAIL_SUSPENDED PUSHBULLET_ACCESS_TOKEN notify_account_authn_link notify_account_authn_link_notification_disabled notify_autossl_expiry notify_autossl_expiry_coverage notify_autossl_renewal notify_autossl_renewal_coverage notify_contact_address_change notify_contact_address_change_notification_disabled notify_disk_limit notify_password_change notify_password_change_notification_disabled notify_ssl_expiry" -- ${cur}) )
    case ${prev} in
      BACKUP|HASCGI|HASDKIM|HASSHELL|HASSPF|rename_database_objects|spamassassin|frontpage|OUTGOING_EMAIL_SUSPENDED|notify_account_authn_link|notify_account_authn_link_notification_disabled|notify_autossl_expiry|notify_autossl_expiry_coverage|notify_autossl_renewal|notify_autossl_renewal_coverage|notify_contact_address_change|notify_contact_address_change_notification_disabled|notify_disk_limit|notify_password_change|notify_password_change_notification_disabled|notify_ssl_expiry )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
      DBOWNER)
        COMPREPLY=( $(compgen -W "$(_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_add_rule
  modsec_add_rule )
    COMPREPLY=( $(compgen -W "config rule" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_add_vendor
  modsec_add_vendor )
    COMPREPLY=( $(compgen -W "url enabled" -- ${cur}) )
    case ${prev} in
      enabled)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_assemble_config_text
  modsec_assemble_config_text )
    COMPREPLY=( $(compgen -W "config text init final deploy" -- ${cur}) )
    case ${prev} in
      init|final|deploy)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_batch_settings
  modsec_batch_settings )
    COMPREPLY=( $(compgen -W "setting_id state remove" -- ${cur}) )
    case ${prev} in
      state)
        COMPREPLY=( $(compgen -W "on off" -- ${cur}) )
        return 0 ;;
      remove)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_check_rule
  modsec_check_rule )
    COMPREPLY=( $(compgen -W "rule" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_clone_rule
  modsec_clone_rule )
    COMPREPLY=( $(compgen -W "config id" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_deploy_all_rule_changes
  modsec_deploy_all_rule_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_deploy_rule_changes
  modsec_deploy_rule_changes )
    COMPREPLY=( $(compgen -W "config" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_deploy_settings_changes
  modsec_deploy_settings_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_rule
  modsec_disable_rule )
    COMPREPLY=( $(compgen -W "config id" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_vendor
  modsec_disable_vendor )
    COMPREPLY=( $(compgen -W "vendor_id" -- ${cur}) )
    case ${prev} in
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_vendor_configs
  modsec_disable_vendor_configs )
    COMPREPLY=( $(compgen -W "vendor_id" -- ${cur}) )
    case ${prev} in
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_vendor_updates
  modsec_disable_vendor_updates )
    COMPREPLY=( $(compgen -W "vendor_id" -- ${cur}) )
    case ${prev} in
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_discard_all_rule_changes
  modsec_discard_all_rule_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_discard_rule_changes
  modsec_discard_rule_changes )
    COMPREPLY=( $(compgen -W "config" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_edit_rule
  modsec_edit_rule )
    COMPREPLY=( $(compgen -W "config id rule" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_enable_vendor
  modsec_enable_vendor )
    COMPREPLY=( $(compgen -W "vendor_id" -- ${cur}) )
    case ${prev} in
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_enable_vendor_configs
  modsec_enable_vendor_configs )
    COMPREPLY=( $(compgen -W "vendor_id" -- ${cur}) )
    case ${prev} in
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_enable_vendor_updates
  modsec_enable_vendor_updates )
    COMPREPLY=( $(compgen -W "vendor_id" -- ${cur}) )
    case ${prev} in
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_configs
  modsec_get_configs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_configs_with_changes_pending
  modsec_get_configs_with_changes_pending )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_config_text
  modsec_get_config_text )
    COMPREPLY=( $(compgen -W "config" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_log
  modsec_get_log )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_rules
  modsec_get_rules )
    COMPREPLY=( $(compgen -W "vendor_id config exclude_other_directives exclude_bare_comments" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
      exclude_other_directives|exclude_bare_comments)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_settings
  modsec_get_settings )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_vendors
  modsec_get_vendors )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_is_installed
  modsec_is_installed )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_make_config_active
  modsec_make_config_active )
    COMPREPLY=( $(compgen -W "config" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_make_config_inactive
  modsec_make_config_inactive )
    COMPREPLY=( $(compgen -W "config" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_preview_vendor
  modsec_preview_vendor )
    COMPREPLY=( $(compgen -W "url" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_remove_rule
  modsec_remove_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_remove_setting
  modsec_remove_setting )
    COMPREPLY=( $(compgen -W "config id" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_remove_vendor
  modsec_remove_vendor )
    COMPREPLY=( $(compgen -W "vendor_id" -- ${cur}) )
    case ${prev} in
      vendor_id)
        COMPREPLY=( $(compgen -W "$(_modsecVendor)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_report_rule
  modsec_report_rule )
    COMPREPLY=( $(compgen -W "row_ids message email type send" -- ${cur}) )
    case ${prev} in
      send)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_set_config_text
  modsec_set_config_text )
    COMPREPLY=( $(compgen -W "config text" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_set_setting
  modsec_set_setting )
    COMPREPLY=( $(compgen -W "setting_id state" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_undisable_rule
  modsec_undisable_rule )
    COMPREPLY=( $(compgen -W "config id" -- ${cur}) )
    case ${prev} in
      config)
        COMPREPLY=( $(compgen -W "$(_modsecConfig)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_update_vendor
  modsec_update_vendor )
    COMPREPLY=( $(compgen -W "url" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+myprivs
  myprivs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nat_checkip
  nat_checkip )
    COMPREPLY=( $(compgen -W "ip" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nat_set_public_ip
  nat_set_public_ip )
    COMPREPLY=( $(compgen -W "local_ip public_ip" -- ${cur}) )
    case ${prev} in
      local_ip)
        COMPREPLY=( $(compgen -W "$(_ips)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nvget
  nvget )
    COMPREPLY=( $(compgen -W "key" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nvset
  nvset )
    COMPREPLY=( $(compgen -W "key value" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_fixcache
  package_manager_fixcache )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_get_build_log
  package_manager_get_build_log )
    COMPREPLY=( $(compgen -W "build offset" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_get_package_info
  package_manager_get_package_info )
    COMPREPLY=( $(compgen -W "ns package disable-excludes" -- ${cur}) )
    case ${prev} in
      ns)
        COMPREPLY=( $(compgen -W "ea" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_is_performing_actions
  package_manager_is_performing_actions )
    COMPREPLY=( $(compgen -W "build" -- ${cur}) )
    return 0 ;;

  package_manager_list_packages )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_resolve_actions
  package_manager_resolve_actions )
    COMPREPLY=( $(compgen -W " package ns" -- ${cur}) )
    case ${prev} in
      ns)
        COMPREPLY=( $(compgen -W "ea" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_submit_actions
  package_manager_submit_actions )
    COMPREPLY=( $(compgen -W "install uninstall upgrade" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_upgrade
  package_manager_upgrade )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+passwd
  passwd )
    COMPREPLY=( $(compgen -W "user password enabledigest digestauth db_pass_update" -- ${cur}) )
    case ${prev} in
       enabledigest|digestauth|db_pass_update )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+pause_transfer_session
  pause_transfer_session )
    COMPREPLY=( $(compgen -W "transfer_session_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_default_accounts_to_fpm
  php_get_default_accounts_to_fpm )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_handlers
  php_get_handlers )
    COMPREPLY=( $(compgen -W "version" -- ${cur}) )
    case ${prev} in
      version )
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_impacted_domains
  php_get_impacted_domains )
    COMPREPLY=( $(compgen -W "system_default domain location" -- ${cur}) )
    case ${prev} in
       system_default )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_installed_versions
  php_get_installed_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_old_fpm_flag
  php_get_old_fpm_flag )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_system_default_version
  php_get_system_default_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_vhosts_by_version
  php_get_vhosts_by_version )
    COMPREPLY=( $(compgen -W "version" -- ${cur}) )
    case ${prev} in
      version)
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_vhost_versions
  php_get_vhost_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_get_content
  php_ini_get_content )
    COMPREPLY=( $(compgen -W "version" -- ${cur}) )
    case ${prev} in
      version )
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_get_directives
  php_ini_get_directives )
    COMPREPLY=( $(compgen -W "version" -- ${cur}) )
    case ${prev} in
      version )
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_set_content
  php_ini_set_content )
    COMPREPLY=( $(compgen -W "version content" -- ${cur}) )
    case ${prev} in
      version )
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_set_directives
  php_ini_set_directives )
    COMPREPLY=( $(compgen -W "version directive directive-{1..9}" -- ${cur}) )
    case ${prev} in
      version )
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_default_accounts_to_fpm
  php_set_default_accounts_to_fpm )
    COMPREPLY=( $(compgen -W "default_accounts_to_fpm" -- ${cur}) )
    case ${prev} in
      default_accounts_to_fpm )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_handler
  php_set_handler )
    COMPREPLY=( $(compgen -W "version handler" -- ${cur}) )
    case ${prev} in
      version )
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
      handler )
        COMPREPLY=( $(compgen -W "cgi suphp dso none" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_old_fpm_flag
  php_set_old_fpm_flag )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_session_save_path
  php_set_session_save_path )
    COMPREPLY=( $(compgen -W "path overwrite" -- ${cur}) )
    case ${prev} in
      overwrite )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_system_default_version
  php_set_system_default_version )
    COMPREPLY=( $(compgen -W "version" -- ${cur}) )
    case ${prev} in
      version)
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_vhost_versions
  php_set_vhost_versions )
    COMPREPLY=( $(compgen -W "php_fpm_pool_parms php_fpm version vhost-0" -- ${cur}) )
    case ${prev} in
      php_fpm_pool_parms )
        COMPREPLY=( $(compgen -W "'{\"pm_max_children\":15,\"pm_process_idle_timeout\":100,\"pm_max_requests\":200}'" -- ${cur}) )
        return 0 ;;
      version )
        COMPREPLY=( $(compgen -W "$(_phpVersion)" -- ${cur}) )
        return 0 ;;
      php_fpm )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+purchase_a_license
  purchase_a_license )
    COMPREPLY=( $(compgen -W "provider url_after_checkout login_token upgrade" -- ${cur}) )
    case ${prev} in
      upgrade )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_cpgreylist_deferred_entries
  read_cpgreylist_deferred_entries )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_cpgreylist_trusted_host
  read_cpgreylist_trusted_host|read_cpgreylist_trusted_hosts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_cphulk_records
  read_cphulk_records )
    COMPREPLY=( $(compgen -W "list_name" -- ${cur}) )
    case ${prev} in
      list_name )
        COMPREPLY=( $(compgen -W "black white" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_featurelist
  read_featurelist )
    COMPREPLY=( $(compgen -W "available_featurelists" -- ${cur}) )
    case ${prev} in
      available_featurelists )
        COMPREPLY=( $(compgen -W "$(_featureListNames)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reboot
  reboot )
    COMPREPLY=( $(compgen -W "force" -- ${cur}) )
    case ${prev} in
      force )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rebuildinstalledssldb
  rebuildinstalledssldb )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rebuild_mail_sni_config
  rebuild_mail_sni_config )
    COMPREPLY=( $(compgen -W "reload_dovecot" -- ${cur}) )
    case ${prev} in
      reload_dovecot )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rebuilduserssldb
  rebuilduserssldb )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+release_outgoing_email
  release_outgoing_email )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_basic_credential_check
  remote_basic_credential_check )
    COMPREPLY=( $(compgen -W "host port user password root_escalation_method root_password ssh_key sshkey_passphrase" -- ${cur}) )
    case ${prev} in
      root_escalation_method )
        COMPREPLY=( $(compgen -W "su sudo" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_create_profile
  remote_mysql_create_profile )
    COMPREPLY=( $(compgen -W "name mysql_host mysql_user mysql_pass mysql_port setup_via" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_create_profile_via_ssh
  remote_mysql_create_profile_via_ssh )
    COMPREPLY=( $(compgen -W "name user password sshkey_name sshkey_passphrase host port root_escalation_method root_password" -- ${cur}) )
    case ${prev} in
      root_escalation_method )
        COMPREPLY=( $(compgen -W "su sudo" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_delete_profile
  remote_mysql_delete_profile )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_initiate_profile_activation
  remote_mysql_initiate_profile_activation )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_monitor_profile_activation
  remote_mysql_monitor_profile_activation )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_read_profile
  remote_mysql_read_profile )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_read_profiles
  remote_mysql_read_profiles )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_update_profile
  remote_mysql_update_profile )
    COMPREPLY=( $(compgen -W "name mysql_host mysql_user mysql_pass mysql_port setup_via" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_validate_profile
  remote_mysql_validate_profile )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+removeacct
  removeacct )
    COMPREPLY=( $(compgen -W "user username keepdns" -- ${cur}) )
    case ${prev} in
      keepdns )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_in_progress_exim_config_edit
  remove_in_progress_exim_config_edit )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_integration_group
  remove_integration_group )
    COMPREPLY=( $(compgen -W "user group_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_integration_link
  remove_integration_link )
    COMPREPLY=( $(compgen -W "user app" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_logo
  remove_logo )
    COMPREPLY=( $(compgen -W "logo_file" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_override_features_for_user
  remove_override_features_for_user )
    COMPREPLY=( $(compgen -W "user features" -- ${cur}) )
    case ${prev} in
      features )
        COMPREPLY=( $(compgen -W "$(_featureList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_style
  remove_style )
    COMPREPLY=( $(compgen -W "type name" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "global reseller user" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+removezonerecord
  removezonerecord )
    COMPREPLY=( $(compgen -W "zone line serialnum" -- ${cur}) )
    case ${prev} in
      zone )
        COMPREPLY=( $(compgen -W "$(_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  remove_autossl_user_excluded_domains )
    COMPREPLY=( $(compgen -W "username domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_mysql_database
  rename_mysql_database )
    COMPREPLY=( $(compgen -W "oldname newname cpuser" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "$(mysql -NBe 'list databses')" -- ${cur}) )
        return 0 ;;
      cpuser )
        COMPREPLY=( $(compgen -W "$(_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_mysql_user
  rename_mysql_user )
    COMPREPLY=( $(compgen -W "oldname newname cpuser" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "$(mysql -NBe 'select user from mysql.user' | sort | uniq | grep -v 'root')" -- ${cur}) )
        return 0 ;;
      cpuser )
        COMPREPLY=( $(compgen -W "$(_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_postgresql_database
  rename_postgresql_database )
    COMPREPLY=( $(compgen -W "oldname newname cpuser" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      cpuser )
        COMPREPLY=( $(compgen -W "$(_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_postgresql_user
  rename_postgresql_user )
    COMPREPLY=( $(compgen -W "oldname newname cpuser" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      cpuser )
        COMPREPLY=( $(compgen -W "$(_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reorder_hooks
  reorder_hooks )
    COMPREPLY=( $(compgen -W "id" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "$(whmapi1 list_hooks | awk '/id:/ {print $2}')" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+resellerstats
  resellerstats )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reset_autossl_provider
  reset_autossl_provider )
    COMPREPLY=( $(compgen -W "provider" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "cPanel LetsEncrypt" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reset_service_ssl_certificate
  reset_service_ssl_certificate )
    COMPREPLY=( $(compgen -W "service" -- ${cur}) )
    case ${prev} in
      service )
        _cpservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+resetzone
  resetzone )
    COMPREPLY=( $(compgen -W "domain zone user" -- ${cur}) )
    case ${prev} in
      zone )
        COMPREPLY=( $(compgen -W "$(ls -1 /var/named/*.db)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+resolvedomainname
  resolvedomainname )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restartservice
  restartservice )
    COMPREPLY=( $(compgen -W "service" -- ${cur}) )
    case ${prev} in
      service )
        _systemservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restoreaccount
  restoreaccount )
    COMPREPLY=( $(compgen -W "user type all ip mail mysql sub" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "monthly weekly daily" -- ${cur}) )
        return 0 ;;
       all|ip|mail|mysql|sub)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_modules_summary
  restore_modules_summary )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_activate
  restore_queue_activate )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_add_task
  restore_queue_add_task )
    COMPREPLY=( $(compgen -W "user restore_point give_ip mysql subdomains mail_config" -- ${cur}) )
    case ${prev} in
      restore_point )
        COMPREPLY=( $(compgen -W "$(for x in /backup/2* /backup/weekly/2* /backup/monthly/2*; do if [[ -d $x ]]; then echo $x; fi; done | awk -F/ '{print $NF}')" -- ${cur}) )
        return 0 ;;
      give_ip|mysql|subdomains|mail_config )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_clear_all_completed_tasks
  restore_queue_clear_all_completed_tasks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_clear_all_failed_tasks
  restore_queue_clear_all_failed_tasks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_clear_all_pending_tasks
  restore_queue_clear_all_pending_tasks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_clear_all_tasks
  restore_queue_clear_all_tasks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_clear_completed_task
  restore_queue_clear_completed_task )
    COMPREPLY=( $(compgen -W "user start_time" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_clear_pending_task
  restore_queue_clear_pending_task )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_is_active
  restore_queue_is_active )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_list_active
  restore_queue_list_active )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_list_completed
  restore_queue_list_completed )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_list_pending
  restore_queue_list_pending )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_state
  restore_queue_state )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+retrieve_transfer_session_remote_analysis
  retrieve_transfer_session_remote_analysis )
    COMPREPLY=( $(compgen -W "transfer_session_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+run_cpkeyclt
  run_cpkeyclt )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+saveacllist
  saveacllist )
    COMPREPLY=( $(compgen -W "acllist acl-edit-pkg acl-add-pkg acl-list-pkgs acl-mailcheck acl-generate-email-config acl-show-bandwidth acl-list-accts acl-acct-summary acl-clustering acl-news acl-thirdparty acl-kill-dns acl-cpanel-api acl-edit-dns acl-park-dns acl-create-dns acl-manage-api-tokens acl-manage-oidc acl-manage-dns-records acl-manage-styles acl-nameserver-config acl-ssl acl-ssl-info acl-mysql-info acl-create-acct acl-suspend-acct acl-basic-system-info acl-basic-whm-functions acl-res-cart acl-passwd acl-ssl-buy acl-cpanel-integration acl-frontpage acl-cors-proxy-get acl-upgrade-account acl-ssl-gencrt acl-create-user-session acl-edit-mx acl-digest-auth acl-kill-acct acl-viewglobalpackages acl-allow-shell acl-add-pkg-shell acl-allow-addoncreate acl-disallow-shell acl-allow-parkedcreate acl-allow-unlimited-disk-pkgs acl-allow-unlimited-pkgs acl-allow-unlimited-bw-pkgs acl-add-pkg-ip acl-locale-edit acl-resftp acl-restart acl-status acl-stats acl-quota acl-demo-setup acl-edit-account acl-limit-bandwidth acl-rearrange-accts acl-track-email acl-all" -- ${cur}) )
    case ${prev} in
      acl-* )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_cpgreylist_config
  save_cpgreylist_config )
    COMPREPLY=( $(compgen -W "spf_bypass child_timeout_secs record_exp_time_mins initial_block_time_mins max_child_procs purge_interval_mins must_try_time_mins" -- ${cur}) )
    case ${prev} in
      spf_bypass )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_cphulk_config
  save_cphulk_config )
    COMPREPLY=( $(compgen -W "is_enabled ip_brute_force_period_mins brute_force_period_mins max_failures max_failures_byip mark_as_brute lookback_period_min lookback_time notify_on_brute notify_on_root_login" -- ${cur}) )
    case ${prev} in
      is_enabled|notify_on_brute|notify_on_root_login )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+savemxs
  savemxs )
    COMPREPLY=( $(compgen -W "domain name exchange preference class ttl serialnum" -- ${cur}) )
    case ${prev} in
      class )
        COMPREPLY=( $(compgen -W "IN" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_spamd_config
  save_spamd_config )
    COMPREPLY=( $(compgen -W "allowedips maxconnperchild maxchildren pidfile timeouttcp timeoutchild" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_style
  save_style )
    COMPREPLY=( $(compgen -W "company_name documentation_url help_url" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+send_test_posturl
  send_test_posturl )
    COMPREPLY=( $(compgen -W "url" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+send_test_pushbullet_note
  send_test_pushbullet_note )
    COMPREPLY=( $(compgen -W "access_token" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+servicestatus
  servicestatus )
    COMPREPLY=( $(compgen -W "service" -- ${cur}) )
    case ${prev} in
      service )
        _systemservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setacls
  setacls )
    COMPREPLY=( $(compgen -W "reseller acllist acl-edit-pkg acl-add-pkg acl-list-pkgs acl-mailcheck acl-generate-email-config acl-show-bandwidth acl-list-accts acl-acct-summary acl-clustering acl-news acl-thirdparty acl-kill-dns acl-cpanel-api acl-edit-dns acl-park-dns acl-create-dns acl-manage-api-tokens acl-manage-oidc acl-manage-dns-records acl-manage-styles acl-nameserver-config acl-ssl acl-ssl-info acl-mysql-info acl-create-acct acl-suspend-acct acl-basic-system-info acl-basic-whm-functions acl-res-cart acl-passwd acl-ssl-buy acl-cpanel-integration acl-frontpage acl-cors-proxy-get acl-upgrade-account acl-ssl-gencrt acl-create-user-session acl-edit-mx acl-digest-auth acl-kill-acct acl-viewglobalpackages acl-allow-shell acl-add-pkg-shell acl-allow-addoncreate acl-disallow-shell acl-allow-parkedcreate acl-allow-unlimited-disk-pkgs acl-allow-unlimited-pkgs acl-allow-unlimited-bw-pkgs acl-add-pkg-ip acl-locale-edit acl-resftp acl-restart acl-status acl-stats acl-quota acl-demo-setup acl-edit-account acl-limit-bandwidth acl-rearrange-accts acl-track-email acl-all" -- ${cur}) )
    case ${prev} in
      reseller )
        COMPREPLY=( $(compgen -W "$(_cpuser) root" -- ${cur}) )
        return 0 ;;
      acl-* )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_application_contact_event_importance
  set_application_contact_event_importance )
    COMPREPLY=( $(compgen -W "app event importance" -- ${cur}) )
    case ${prev} in
      importance )
        COMPREPLY=( $(compgen -W "High Medium Low Disabled" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_application_contact_importance
  set_application_contact_importance )
    COMPREPLY=( $(compgen -W "app importance" -- ${cur}) )
    case ${prev} in
      importance )
        COMPREPLY=( $(compgen -W "High Medium Low Disabled" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_autossl_metadata
  set_autossl_metadata )
    COMPREPLY=( $(compgen -W "metadata_json clobber_externally_signed notify_autossl_expiry notify_autossl_expiry_coverage notify_autossl_renewal notify_autossl_renewal_coverage notify_autossl_renewal_coverage_reduced notify_autossl_renewal_uncovered_domains" -- ${cur}) )
    case ${prev} in
      clobber_externally_signed|notify_autossl_expiry|notify_autossl_expiry_coverage|notify_autossl_renewal|notify_autossl_renewal_coverage|notify_autossl_renewal_coverage_reduced|notify_autossl_renewal_uncovered_domains )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_autossl_metadata_key
  set_autossl_metadata_key )
    COMPREPLY=( $(compgen -W "key value" -- ${cur}) )
    case ${prev} in
      key )
        COMPREPLY=( $(compgen -W "clobber_externally_signed notify_autossl_expiry notify_autossl_expiry_coverage notify_autossl_renewal notify_autossl_renewal_coverage notify_autossl_renewal_coverage_reduced notify_autossl_renewal_uncovered_domains" -- ${cur}) )
        return 0 ;;
      value )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_autossl_provider
  set_autossl_provider )
    COMPREPLY=( $(compgen -W "provider" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "cPanel LetsEncrypt" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_cpanel_updates
  set_cpanel_updates )
    COMPREPLY=( $(compgen -W "updates" -- ${cur}) )
    case ${prev} in
      updates )
        COMPREPLY=( $(compgen -W "daily manual never" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_cphulk_config_key
  set_cphulk_config_key )
    COMPREPLY=( $(compgen -W "block_brute_force_with_firewall block_excessive_brute_force_with_firewall brute_force_period_mins brute_force_period_sec command_to_run_on_brute_force command_to_run_on_excessive_brute_force country_blacklist country_whitelist ip_based_protection ip_brute_force_period_mins ip_brute_force_period_sec is_enabled lookback_period_min lookback_time mark_as_brute max_failures max_failures_byip notify_on_brute notify_on_root_login notify_on_root_login_for_known_netblock username_based_protection username_based_protection_for_root username_based_protection_local_origin" -- ${cur}) )
    case ${prev} in
       block_brute_force_with_firewall|block_excessive_brute_force_with_firewall|ip_based_protection|is_enabled|notify_on_brute|notify_on_root_login|notify_on_root_login_for_known_netblock|username_based_protection|username_based_protection_for_root|username_based_protection_local_origin )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
       country_blacklist|country_whitelist )
        COMPREPLY=( $(compgen -W "$(_countryCodes)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_default
  set_default )
    COMPREPLY=( $(compgen -W "type name" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "default global reseller user" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_digest_auth
  set_digest_auth )
    COMPREPLY=( $(compgen -W "user password enabledigest digestauth" -- ${cur}) )
    case ${prev} in
      enabledigest|digestauth )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+sethostname
  sethostname )
    COMPREPLY=( $(compgen -W "hostname" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_local_mysql_root_password
  set_local_mysql_root_password )
    COMPREPLY=( $(compgen -W "password update_config" -- ${cur}) )
    case ${prev} in
      update_config )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_market_product_attribute
  set_market_product_attribute )
    COMPREPLY=( $(compgen -W "provider product_id attribute value" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_market_provider_commission_id
  set_market_provider_commission_id )
    COMPREPLY=( $(compgen -W "provider commission_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setminimumpasswordstrengths
  setminimumpasswordstrengths )
    COMPREPLY=( $(compgen -W "default bandmin cpaddons createacct ftp list mysql passwd pop postgres sshkey webdisk virtual" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_mysql_password
  set_mysql_password )
    COMPREPLY=( $(compgen -W "user password cpuser" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(mysql -NBe 'select user from mysql.user' | sort | uniq)" -- ${cur}) )
        return 0 ;;
      cpuser )
        COMPREPLY=( $(compgen -W "$(_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_postgresql_password
  set_postgresql_password )
    COMPREPLY=( $(compgen -W "user password cpuser" -- ${cur}) )
    case ${prev} in
      cpuser )
        COMPREPLY=( $(compgen -W "$(_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_primary_servername
  set_primary_servername )
    COMPREPLY=( $(compgen -W "servername type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "std ssl" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_provider_client_configurations
  set_provider_client_configurations )
    COMPREPLY=( $(compgen -W "service_name provider_id configurations" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_provider_display_configurations
  set_provider_display_configurations )
    COMPREPLY=( $(compgen -W "service_name provider_id configurations" -- ${cur}) )
    case ${prev} in
      configurations )
        COMPREPLY=( $(compgen -W "display_name label icon textcolor icon_type color" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_public_contact
  set_public_contact )
    COMPREPLY=( $(compgen -W "name url " -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellerips
  setresellerips )
    COMPREPLY=( $(compgen -W "user ips delegate" -- ${cur}) )
    case ${prev} in
      delegate )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellerlimits
  setresellerlimits )
    COMPREPLY=( $(compgen -W "user enable_account_limit account_limit enable_resource_limits bandwidth_limit enable_overselling enable_overselling_bandwidth enable_overselling_diskspace diskspace_limit enable_package_limits enable_package_limit_numbers" -- ${cur}) )
    case ${prev} in
      enable_account_limit|enable_overselling|enable_overselling_bandwidth|enable_overselling_diskspace|enable_package_limits|enable_package_limit_numbers )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellermainip
  setresellermainip )
    COMPREPLY=( $(compgen -W "user ip" -- ${cur}) )
    case ${prev} in
      ip )
        COMPREPLY=( $(compgen -W "$(_ips)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellernameservers
  setresellernameservers )
    COMPREPLY=( $(compgen -W "user nameservers" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellerpackagelimit
  setresellerpackagelimit )
    COMPREPLY=( $(compgen -W "user no_limit package allowed number" -- ${cur}) )
    case ${prev} in
      no_limit|allowed )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
      package )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresolvers
  setresolvers )
    COMPREPLY=( $(compgen -W "nameserver1 nameserver2 nameserver3" -- ${cur}) )
    return 0 ;;

  set_autossl_user_excluded_domains )
    COMPREPLY=( $(compgen -W "username domain" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_service_config_key
  set_service_config_key )
    COMPREPLY=( $(compgen -W "service key value" -- ${cur}) )
    case ${prev} in
      service )
        COMPREPLY=( $(compgen -W "dovecot" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setsiteip
  setsiteip )
    COMPREPLY=( $(compgen -W "ip user domain" -- ${cur}) )
    case ${prev} in
      ip )
        COMPREPLY=( $(compgen -W "$(_ips)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_tier
  set_tier )
    COMPREPLY=( $(compgen -W "tier" -- ${cur}) )
    case ${prev} in
      tier )
        COMPREPLY=( $(compgen -W "edge current release stable" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_tweaksetting
  set_tweaksetting )
    COMPREPLY=( $(compgen -W "key module value" -- ${cur}) )
    case ${prev} in
      key )
        COMPREPLY=( $(compgen -W "$(awk -F= '{print $1}' /var/cpanel/cpanel.config)" -- ${cur}) )
        return 0 ;;
      module )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setupreseller
  setupreseller )
    COMPREPLY=( $(compgen -W "user makeowner" -- ${cur}) )
    case ${prev} in
      makeowner )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_user_email_forward_destination
  set_user_email_forward_destination )
    COMPREPLY=( $(compgen -W "user forward_to" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+showbw
  showbw )
    COMPREPLY=( $(compgen -W "month year showres search searchtype" -- ${cur}) )
    case ${prev} in
      month )
        COMPREPLY=( $(compgen -W "{1..12}" -- ${cur}) )
        return 0 ;;
      year )
        COMPREPLY=( $(compgen -W "$(seq $(date --date='-10 year' +%Y) $(date +%Y))" -- ${cur}) )
        return 0 ;;
      searchtype )
        COMPREPLY=( $(compgen -W "domain owner user ip package" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_autossl_check_for_all_users
  start_autossl_check_for_all_users )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_autossl_check_for_one_user
  start_autossl_check_for_one_user )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_background_mysql_upgrade
  start_background_mysql_upgrade )
    COMPREPLY=( $(compgen -W "version" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_background_pkgacct
  start_background_pkgacct )
    COMPREPLY=( $(compgen -W "user skiphomedir use_backups serialized_output tarroot compressionsetting mysqlver skipacctdb skipbwdata low_priority split" -- ${cur}) )
    case ${prev} in
      skiphomedir|use_backups|serialized_output|skipacctdb|skipbwdata|low_priority|split)
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
      compressionsetting )
        COMPREPLY=( $(compgen -W "compressed null" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_transfer_session
  start_transfer_session )
    COMPREPLY=( $(compgen -W "transfer_session_id" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+suspendacct
  suspendacct )
    COMPREPLY=( $(compgen -W "user reason disallowun" -- ${cur}) )
    case ${prev} in
      disallowun )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+suspend_outgoing_email
  suspend_outgoing_email )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+suspendreseller
  suspendreseller )
    COMPREPLY=( $(compgen -W "user reason" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+systemloadavg
  systemloadavg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+system_needs_reboot
  system_needs_reboot )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+terminatereseller
  terminatereseller )
    COMPREPLY=( $(compgen -W "user terminatereseller" -- ${cur}) )
    case ${prev} in
      terminatereseller )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_create_stub_ticket
  ticket_create_stub_ticket )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_get_support_agreement
  ticket_get_support_agreement )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_grant
  ticket_grant )
    COMPREPLY=( $(compgen -W "ticket_id server_num ssh_username" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_list
  ticket_list )
    COMPREPLY=( $(compgen -W "ticket_id server_num ssh_username" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_remove_closed
  ticket_remove_closed )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_revoke
  ticket_revoke )
    COMPREPLY=( $(compgen -W "ticket_id server_num" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_ssh_test
  ticket_ssh_test )
    COMPREPLY=( $(compgen -W "ticket_id server_num" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++ticket_ssh_test_start
  ticket_ssh_test_start )
    COMPREPLY=( $(compgen -W "ticket_id server_num" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_update_service_agreement_approval
  ticket_update_service_agreement_approval )
    COMPREPLY=( $(compgen -W "version" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_validate_oauth2_code
  ticket_validate_oauth2_code )
    COMPREPLY=( $(compgen -W "code redirect_uri" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_whitelist_check
  ticket_whitelist_check )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_whitelist_setup
  ticket_whitelist_setup )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_whitelist_unsetup
  ticket_whitelist_unsetup )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+toggle_user_backup_state
  toggle_user_backup_state )
    COMPREPLY=( $(compgen -W "user legacy" -- ${cur}) )
    case ${prev} in
      legacy )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+transfer_module_schema
  transfer_module_schema )
    COMPREPLY=( $(compgen -W "module" -- ${cur}) )
    case ${prev} in
      module )
        COMPREPLY=( $(compgen -W "AccountLocal AccountRemoteRoot AccountRemoteUser FeatureListRemoteRoot LegacyAccountBackup PackageRemoteRoot" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_disable_policy
  twofactorauth_disable_policy )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_enable_policy
  twofactorauth_enable_policy )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_generate_tfa_config
  twofactorauth_generate_tfa_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_get_issuer
  twofactorauth_get_issuer )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_get_user_configs
  twofactorauth_get_user_configs )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_policy_status
  twofactorauth_policy_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_remove_user_config
  twofactorauth_remove_user_config )
    COMPREPLY=( $(compgen -W "user user-{1..9}" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_set_issuer
  twofactorauth_set_issuer )
    COMPREPLY=( $(compgen -W "issuer" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_set_tfa_config
  twofactorauth_set_tfa_config )
    COMPREPLY=( $(compgen -W "secret tfa_token" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+uninstall_rpm_plugin
  uninstall_rpm_plugin )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unlink_user_authn_provider
  unlink_user_authn_provider )
    COMPREPLY=( $(compgen -W "username service_name provider_id subject_unique_identifier" -- ${cur}) )
    case ${prev} in
      service_name )
        _whmservice
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsetupreseller
  unsetupreseller )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsuspendacct
  unsuspendacct )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsuspend_outgoing_email
  unsuspend_outgoing_email )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsuspendreseller
  unsuspendreseller )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++untrack_acct_id
  untrack_acct_id )
    COMPREPLY=( $(compgen -W "uid gid protect_system check_exists check_quota" -- ${cur}) )
    case ${prev} in
      protect_system|check_exists|check_quota )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_configclusterserver
  update_configclusterserver )
    COMPREPLY=( $(compgen -W "name user key" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_featurelist
  update_featurelist )
    COMPREPLY=( $(compgen -W "featurelist $(_featureList)" -- ${cur}) )
    case ${prev} in
      featurelist )
        COMPREPLY=( $(compgen -W "$(_featureListNames)" -- ${cur}) )
        return 0 ;;
      * )
        COMPREPLY=( $(compgen -W "0 1" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_integration_link_token
  update_integration_link_token )
    COMPREPLY=( $(compgen -W "user app token" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_updateconf
  update_updateconf )
    COMPREPLY=( $(compgen -W "CPANEL RPMUP SARULESUP UPDATES STAGING_DIR " -- ${cur}) )
    case ${prev} in
      CPANEL )
        COMPREPLY=( $(compgen -W "STABLE RELEASE CURRENT EDGE" -- ${cur}) )
        return 0 ;;
      RPMUP|SARULESUP|UPDATES)
        COMPREPLY=( $(compgen -W "daily manual never" -- ${cur}) )
        return 0 ;;
      STAGING_DIR )
        COMPREPLY=( $(compgen -W "/usr/local/cpanel" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_current_installed_exim_config
  validate_current_installed_exim_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_exim_configuration_syntax
  validate_exim_configuration_syntax )
    COMPREPLY=( $(compgen -W "cfg_text section" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_login_token
  validate_login_token )
    COMPREPLY=( $(compgen -W "provider url_after_login login_token" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_system_user
  validate_system_user )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_aim_access
  verify_aim_access )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_icq_access
  verify_icq_access )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_new_username
  verify_new_username )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_new_username_for_restore
  verify_new_username_for_restore )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_oscar_access
  verify_oscar_access )
    COMPREPLY=( $(compgen -W "username password" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_posturl_access
  verify_posturl_access )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_pushbullet_access
  verify_pushbullet_access )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_user_has_feature
  verify_user_has_feature )
    COMPREPLY=( $(compgen -W "user feature" -- ${cur}) )
    case ${prev} in
      feature )
        COMPREPLY=( $(compgen -W "$(_featureList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+version
  version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  *) ;;
esac

COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
return 0;
}

#If root user then allow tab complete of whmapi1
if [[ $UID == 0 ]]; then
  complete -F _whmapi1 whmapi1;
fi
