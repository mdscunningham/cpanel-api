Backup Bandwidth Batch Brand Branding CacheBuster Chkservd Chrome Contactus cPAddons cPGreyList DAV DCV DNS DNSSEC DomainInfo Email ExternalAuthentication Features Fileman Ftp Integration LangPHP LastLogin Locale Mailboxes Market Mime ModSecurity Mysql Notifications NVData Parser PassengerApps PasswdStrength Postgresql Pushbullet Quota Resellers ResourceUsage Restore Session SiteTemplates SpamAssassin SSH SSL StatsBar Styles Themes TwoFactorAuth UserManager UserTasks VersionControl VersionControlDeployment WebDisk WebmailApps WebVhost WordPressInstanceManager
Backup )
  COMPREPLY=( $(compgen -W "list_backups" -- ${cur}) )

  case ${functionName} in

  list_backups )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Bandwidth )
  COMPREPLY=( $(compgen -W "get_retention_periods query" -- ${cur}) )

  case ${functionName} in

  get_retention_periods )
    COMPREPLY=( $(compgen -W "grouping interval domains protocols start end timezone" -- ${cur}) )
    case ${prev} in
      grouping )
        COMPREPLY=( $(compgen -W "domain protocol year year_month year_month_day year_month_day_hour year_month_day_mour_minute" -- ${cur}) )
        return 0 ;;
      interval )
        COMPREPLY=( $(compgen -W "daily hourly 5min" -- ${cur}) )
        return 0 ;;
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      protocols )
        COMPREPLY=( $(compgen -W "http imap smtp pop3 ftp" -- ${cur}) )
        return 0 ;;
      start )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      end )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      timezone )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  query )
    COMPREPLY=( $(compgen -W "grouping interval domains protocols start end timezone" -- ${cur}) )
    case ${prev} in
      grouping )
        COMPREPLY=( $(compgen -W "domain protocol year year_month year_month_day year_month_day_hour year_month_day_mour_minute" -- ${cur}) )
        return 0 ;;
      interval )
        COMPREPLY=( $(compgen -W "daily hourly 5min" -- ${cur}) )
        return 0 ;;
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      protocols )
        COMPREPLY=( $(compgen -W "http imap smtp pop3 ftp" -- ${cur}) )
        return 0 ;;
      start )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      end )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      timezone )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Batch )
  COMPREPLY=( $(compgen -W "strict" -- ${cur}) )

  case ${functionName} in

  strict )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Brand )
  COMPREPLY=( $(compgen -W "read" -- ${cur}) )

  case ${functionName} in

  read )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Branding )
  COMPREPLY=( $(compgen -W "file get_application_information get_applications get_available_applications get_information_for_applications image include spritelist" -- ${cur}) )

  case ${functionName} in

  file )
    COMPREPLY=( $(compgen -W "file needfile skipdefault checkmain nomagic" -- ${cur}) )
    case ${prev} in
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      needfile )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      skipdefault )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      checkmain )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      nomagic )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_application_information )
    COMPREPLY=( $(compgen -W "app_key" -- ${cur}) )
    case ${prev} in
      app_key )
        COMPREPLY=( $(compgen -W "$(_uapi_appkey)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_applications )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_available_applications )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_information_for_applications )
    COMPREPLY=( $(compgen -W "docroot app_keys" -- ${cur}) )
    case ${prev} in
      docroot )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      app_keys )
        COMPREPLY=( $(compgen -W "$(_uapi_appkey)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  image )
    COMPREPLY=( $(compgen -W "imagefile needfile reqext skip_logo_check nomagic" -- ${cur}) )
    case ${prev} in
      imagefile )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      needfile )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      reqext )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      skip_logo_check )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      nomagic )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  include )
    COMPREPLY=( $(compgen -W "file skip_default raw" -- ${cur}) )
    case ${prev} in
      file )
        COMPREPLY=( $(compgen -W "/usr/local/cpanel/base/<APPNAME>/<THEME>/branding" -- ${cur}) )
        return 0 ;;
      skip_default )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      raw )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  spritelist )
    COMPREPLY=( $(compgen -W "image img imgtype method skipgroups subtype" -- ${cur}) )
    case ${prev} in
      image )
        COMPREPLY=( $(compgen -W "heading" -- ${cur}) )
        return 0 ;;
      img )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      imgtype )
        COMPREPLY=( $(compgen -W "icon" -- ${cur}) )
        return 0 ;;
      method )
        COMPREPLY=( $(compgen -W "only_filetype_gif skip_filetype_gif snap_to_smallest_width scale_60percent" -- ${cur}) )
        return 0 ;;
      skipgroups )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      subtype )
        COMPREPLY=( $(compgen -W "img bg compleximg" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

CacheBuster )
  COMPREPLY=( $(compgen -W "read update" -- ${cur}) )

  case ${functionName} in

  read )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  update )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Chkservd )
  COMPREPLY=( $(compgen -W "get_exim_ports get_exim_ports_ssl" -- ${cur}) )

  case ${functionName} in

  get_exim_ports )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_exim_ports_ssl )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Chrome )
  COMPREPLY=( $(compgen -W "get_dom" -- ${cur}) )

  case ${functionName} in

  get_dom )
    COMPREPLY=( $(compgen -W "page_title" -- ${cur}) )
    case ${prev} in
      page_title )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Contactus )
  COMPREPLY=( $(compgen -W "is_enabled" -- ${cur}) )

  case ${functionName} in

  is_enabled )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

cPAddons )
  COMPREPLY=( $(compgen -W "get_available_addons get_instance_settings list_addon_instances" -- ${cur}) )

  case ${functionName} in

  get_available_addons )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_instance_settings )
    COMPREPLY=( $(compgen -W "unique_id" -- ${cur}) )
    case ${prev} in
      unique_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_addon_instances )
    COMPREPLY=( $(compgen -W "addon" -- ${cur}) )
    case ${prev} in
      addon )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

cPGreyList )
  COMPREPLY=( $(compgen -W "disable_all_domains disable_domains enable_all_domains enable_domains has_greylisting_enabled list_domains" -- ${cur}) )

  case ${functionName} in

  disable_all_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  disable_domains )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_all_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  enable_domains )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  has_greylisting_enabled )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

DAV )
  COMPREPLY=( $(compgen -W "disable_shared_global_addressbook enable_shared_global_addressbook get_calendar_contacts_config has_shared_global_addressbook is_dav_service_enabled is_horde_enabled" -- ${cur}) )

  case ${functionName} in

  disable_shared_global_addressbook )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_shared_global_addressbook )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_calendar_contacts_config )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  has_shared_global_addressbook )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  is_dav_service_enabled )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  is_horde_enabled )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

DCV )
  COMPREPLY=( $(compgen -W "check_domains_via_dns check_domains_via_http ensure_domains_can_pass_dcv" -- ${cur}) )

  case ${functionName} in

  check_domains_via_dns )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  check_domains_via_http )
    COMPREPLY=( $(compgen -W "domain dcv_file_allowed_characters dcv_file_random_character_count dcv_file_extension dcv_file_relative_path dcv_user_agent_string" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      dcv_file_allowed_characters )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      dcv_file_random_character_count )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      dcv_file_extension )
        COMPREPLY=( $(compgen -W "txt" -- ${cur}) )
        return 0 ;;
      dcv_file_relative_path )
        COMPREPLY=( $(compgen -W ".well-known/" -- ${cur}) )
        return 0 ;;
      dcv_user_agent_string )
        COMPREPLY=( $(compgen -W "Cpanel-HTTP-Client/1.0 COMODO+DCV" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  ensure_domains_can_pass_dcv )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

DNS )
  COMPREPLY=( $(compgen -W "ensure_domains_reside_only_locally" -- ${cur}) )

  case ${functionName} in

  ensure_domains_reside_only_locally )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

DNSSEC )
  COMPREPLY=( $(compgen -W "disable_dnssec enable_dnssec fetch_ds_records set_nsec3 unset_nsec3" -- ${cur}) )

  case ${functionName} in

  disable_dnssec )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_dnssec )
    COMPREPLY=( $(compgen -W "domain use_nsec3 nsec3_opt_out nsec3_iterations nsec3_narrow nsec3_salt" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      use_nsec3 )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      nsec3_opt_out )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      nsec3_iterations )
        COMPREPLY=( $(compgen -W "nsec3_iterations" -- ${cur}) )
        return 0 ;;
      nsec3_narrow )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      nsec3_salt )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  fetch_ds_records )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_nsec3 )
    COMPREPLY=( $(compgen -W "domain nsec3_opt_out nsec3_iterations nsec3_narrow nsec3_salt" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      nsec3_opt_out )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      nsec3_iterations )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      nsec3_narrow )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      nsec3_salt )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  unset_nsec3 )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

DomainInfo )
  COMPREPLY=( $(compgen -W "domains_data list_domains main_domain_builtin_subdomain_aliases single_domain_data" -- ${cur}) )

  case ${functionName} in

  domains_data )
    COMPREPLY=( $(compgen -W "format" -- ${cur}) )
    case ${prev} in
      format )
        COMPREPLY=( $(compgen -W "hash list" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  main_domain_builtin_subdomain_aliases )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  single_domain_data )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Email )
  COMPREPLY=( $(compgen -W "account_name add_auto_responder add_domain_forwarder add_forwarder add_list add_mailman_delegates add_mx add_pop add_spam_filter browse_mailbox change_mx check_fastmail check_pipe_forwarder delete_auto_responder delete_domain_forwarder delete_filter delete_forwarder delete_held_messages delete_list delete_mx delete_pop disable_filter disable_spam_assassin disable_spam_autodelete disable_spam_box dispatch_client_settings edit_pop_quota enable_filter enable_spam_assassin enable_spam_box fetch_charmaps fts_rescan_mailbox generate_mailman_otp get_auto_responder get_charsets get_client_settings get_default_email_quota get_default_email_quota_mib get_disk_usage get_filter get_held_message_count get_mailman_delegates get_main_account_disk_usage get_main_account_disk_usage_bytes get_max_email_quota get_max_email_quota_mib get_pop_quota get_spam_settings get_webmail_settings has_delegated_mailman_lists has_plaintext_authentication hold_outgoing is_integer list_auto_responders list_default_address list_domain_forwarders list_filters list_filters_backups list_forwarders list_forwarders_backups list_lists list_mail_domains list_mxs list_pops list_pops_with_disk list_system_filter_info passwd_list passwd_pop release_outgoing remove_mailman_delegates reorder_filters set_always_accept set_default_address set_list_privacy_options stats_db_status store_filter suspend_incoming suspend_login suspend_outgoing trace_filter unsuspend_incoming unsuspend_login unsuspend_outgoing verify_password" -- ${cur}) )

  case ${functionName} in

  account_name )
    COMPREPLY=( $(compgen -W "account display" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      display )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_auto_responder )
    COMPREPLY=( $(compgen -W "email from subject body domain is_html charset interval start stop" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
      from )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      subject )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      body )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      is_html )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      charset )
        COMPREPLY=( $(compgen -W "UTF-8" -- ${cur}) )
        return 0 ;;
      interval )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      start )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      stop )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_domain_forwarder )
    COMPREPLY=( $(compgen -W "domain destdomain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      destdomain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_forwarder )
    COMPREPLY=( $(compgen -W "domain email fwdopt fwdemail fwdsystem failmsgs pipefwd" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      fwdopt )
        COMPREPLY=( $(compgen -W "fwd fail blackhole pipe system" -- ${cur}) )
        return 0 ;;
      fwdemail )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      fwdsystem )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser)" -- ${cur}) )
        return 0 ;;
      failmsgs )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pipefwd )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_list )
    COMPREPLY=( $(compgen -W "list password domain rebuildonly private" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      rebuildonly )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      private )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_mailman_delegates )
    COMPREPLY=( $(compgen -W "list delegates" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      delegates )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_mx )
    COMPREPLY=( $(compgen -W "domain exchanger priority alwaysaccept" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      exchanger )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      priority )
        COMPREPLY=( $(compgen -W "0 1 {5..50..5}" -- ${cur}) )
        return 0 ;;
      alwaysaccept )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_pop )
    COMPREPLY=( $(compgen -W "email password domain quota skip_update_db password_hash" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      skip_update_db )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      password_hash )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_spam_filter )
    COMPREPLY=( $(compgen -W "required_score account" -- ${cur}) )
    case ${prev} in
      required_score )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  browse_mailbox )
    COMPREPLY=( $(compgen -W "account dir showdotfiles" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      showdotfiles )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  change_mx )
    COMPREPLY=( $(compgen -W "domain exchanger oldexchanger priority oldpriority alwaysaccept" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      exchanger )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      oldexchanger )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      priority )
        COMPREPLY=( $(compgen -W "0 1 {5..50..5}" -- ${cur}) )
        return 0 ;;
      oldpriority )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      alwaysaccept )
        COMPREPLY=( $(compgen -W "auto local secondary remote" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  check_fastmail )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  check_pipe_forwarder )
    COMPREPLY=( $(compgen -W "pipe_name" -- ${cur}) )
    case ${prev} in
      pipe_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_auto_responder )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_domain_forwarder )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_filter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_forwarder )
    COMPREPLY=( $(compgen -W "address forwarder" -- ${cur}) )
    case ${prev} in
      address )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      forwarder )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_held_messages )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_list )
    COMPREPLY=( $(compgen -W "list" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_mx )
    COMPREPLY=( $(compgen -W "domain exchanger priority" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      exchanger )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      priority )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_pop )
    COMPREPLY=( $(compgen -W "email flags domain skip_quota" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      flags )
        COMPREPLY=( $(compgen -W "passwd" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      skip_quota )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  disable_filter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  disable_spam_assassin )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  disable_spam_autodelete )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  disable_spam_box )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  dispatch_client_settings )
    COMPREPLY=( $(compgen -W "to account" -- ${cur}) )
    case ${prev} in
      to )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      account )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  edit_pop_quota )
    COMPREPLY=( $(compgen -W "email domain quota" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_filter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_spam_assassin )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  enable_spam_box )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  fetch_charmaps )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  fts_rescan_mailbox )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  generate_mailman_otp )
    COMPREPLY=( $(compgen -W "list" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_auto_responder )
    COMPREPLY=( $(compgen -W "email temp_charset" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
      temp_charset )
        COMPREPLY=( $(compgen -W "utf-8 us-ascii" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_charsets )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_client_settings )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_default_email_quota )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_default_email_quota_mib )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_disk_usage )
    COMPREPLY=( $(compgen -W "user domain" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_filter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_held_message_count )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_mailman_delegates )
    COMPREPLY=( $(compgen -W "list" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_main_account_disk_usage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_main_account_disk_usage_bytes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_max_email_quota )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_max_email_quota_mib )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_pop_quota )
    COMPREPLY=( $(compgen -W "email domain as_bytes" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      as_bytes )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_spam_settings )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_webmail_settings )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  has_delegated_mailman_lists )
    COMPREPLY=( $(compgen -W "delegate" -- ${cur}) )
    case ${prev} in
      delegate )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  has_plaintext_authentication )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  hold_outgoing )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  is_integer )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_auto_responders )
    COMPREPLY=( $(compgen -W "domain regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_default_address )
    COMPREPLY=( $(compgen -W "domain user" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_domain_forwarders )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_filters )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_filters_backups )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_forwarders )
    COMPREPLY=( $(compgen -W "domain regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_forwarders_backups )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_lists )
    COMPREPLY=( $(compgen -W "domain regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_mail_domains )
    COMPREPLY=( $(compgen -W "select add_www include_wildcard" -- ${cur}) )
    case ${prev} in
      select )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      add_www )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      include_wildcard )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_mxs )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_pops )
    COMPREPLY=( $(compgen -W "regex no_validate skip_main" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      no_validate )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      skip_main )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_pops_with_disk )
    COMPREPLY=( $(compgen -W "domain maxaccounts no_disk no_validate regex email domain infinityimg infinitylang" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      maxaccounts )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      no_disk )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      no_validate )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      infinityimg )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      infinitylang )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_system_filter_info )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  passwd_list )
    COMPREPLY=( $(compgen -W "list password" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  passwd_pop )
    COMPREPLY=( $(compgen -W "email password domain" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailuser)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  release_outgoing )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  remove_mailman_delegates )
    COMPREPLY=( $(compgen -W "list delegates" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      delegates )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  reorder_filters )
    COMPREPLY=( $(compgen -W "mailbox filter filter{1..9}" -- ${cur}) )
    case ${prev} in
      mailbox )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      filter )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      filter{1..9} )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_always_accept )
    COMPREPLY=( $(compgen -W "domain mxcheck alwaysaccept" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      mxcheck )
        COMPREPLY=( $(compgen -W "auto local secondary remote" -- ${cur}) )
        return 0 ;;
      alwaysaccept )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_default_address )
    COMPREPLY=( $(compgen -W "domain fwdopt fwdemail failmsgs pipefwd" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      fwdopt )
        COMPREPLY=( $(compgen -W "fwd fail failmsgs blackhole pipe" -- ${cur}) )
        return 0 ;;
      fwdemail )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      failmsgs )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pipefwd )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_list_privacy_options )
    COMPREPLY=( $(compgen -W "list advertised archive_private subscribe_policy" -- ${cur}) )
    case ${prev} in
      list )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      advertised )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      archive_private )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      subscribe_policy )
        COMPREPLY=( $(compgen -W "1 2 3" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  stats_db_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  store_filter )
    COMPREPLY=( $(compgen -W "account filtername oldfiltername action{1..9} dest{1..9} match{1..9} opt{1..9} part{1..9} val{1..9}" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      oldfiltername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      action{1..9} )
        COMPREPLY=( $(compgen -W "deliver fail finish save pipe" -- ${cur}) )
        return 0 ;;
      dest{1..9} )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      match{1..9} )
        COMPREPLY=( $(compgen -W "is matches contains does%20not%20contain begins does%20not%20begin ends does%20not%20end does%20not%20match is%20above is%20not%20above is%20below is%20not%20below" -- ${cur}) )
        return 0 ;;
      opt{1..9} )
        COMPREPLY=( $(compgen -W "and or" -- ${cur}) )
        return 0 ;;
      part{1..9} )
        COMPREPLY=( $(compgen -W "$header_from" -- ${cur}) )
        return 0 ;;
      val{1..9} )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  suspend_incoming )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  suspend_login )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  suspend_outgoing )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  trace_filter )
    COMPREPLY=( $(compgen -W "account msg" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      msg )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  unsuspend_incoming )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  unsuspend_login )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  unsuspend_outgoing )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  verify_password )
    COMPREPLY=( $(compgen -W "email password" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_uapi_emailaddress)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

ExternalAuthentication )
  COMPREPLY=( $(compgen -W "add_authn_link configured_modules get_authn_links has_external_auth_modules_configured remove_authn_link" -- ${cur}) )

  case ${functionName} in

  add_authn_link )
    COMPREPLY=( $(compgen -W "username provider_id subject_unique_identifier preferred_username" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser)" -- ${cur}) )
        return 0 ;;
      provider_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      subject_unique_identifier )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      preferred_username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  configured_modules )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_authn_links )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  has_external_auth_modules_configured )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  remove_authn_link )
    COMPREPLY=( $(compgen -W "provider subject_unique_identifier" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      subject_unique_identifier )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Features )
  COMPREPLY=( $(compgen -W "has_feature list_features" -- ${cur}) )

  case ${functionName} in

  has_feature )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_features)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_features )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Fileman )
  COMPREPLY=( $(compgen -W "autocompletedir empty_trash get_file_content get_file_information list_files save_file_content transcode upload_files" -- ${cur}) )

  case ${functionName} in

  autocompletedir )
    COMPREPLY=( $(compgen -W "path dirsonly list_all html" -- ${cur}) )
    case ${prev} in
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      dirsonly )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      list_all )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      html )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  empty_trash )
    COMPREPLY=( $(compgen -W "older_than" -- ${cur}) )
    case ${prev} in
      older_than )
        COMPREPLY=( $(compgen -W "{0..31}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_file_content )
    COMPREPLY=( $(compgen -W "dir file from_charset to_charset" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      from_charset )
        COMPREPLY=( $(compgen -W "$(_uapi_DETECT_)" -- ${cur}) )
        return 0 ;;
      to_charset )
        COMPREPLY=( $(compgen -W "$(_uapi_LOCALE_)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_file_information )
    COMPREPLY=( $(compgen -W "path show_hidden check_for_leaf_directories include_mime include_hash include_permissions" -- ${cur}) )
    case ${prev} in
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      show_hidden )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      check_for_leaf_directories )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      include_mime )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      include_hash )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      include_permissions )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_files )
    COMPREPLY=( $(compgen -W "dirs types limit_to_list only_these_files show_hidden check_for_leaf_directories mime_types raw_mime_types include_mime include_hash include_permissions" -- ${cur}) )
    case ${prev} in
      dirs )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      types )
        COMPREPLY=( $(compgen -W "file dir char block fifo link socket" -- ${cur}) )
        return 0 ;;
      limit_to_list )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      only_these_files )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      show_hidden )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      check_for_leaf_directories )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      mime_types )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      raw_mime_types )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      include_mime )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      include_hash )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      include_permissions )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  save_file_content )
    COMPREPLY=( $(compgen -W "dir file from_charset to_charset content fallback" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      from_charset )
        COMPREPLY=( $(compgen -W "UTF-8" -- ${cur}) )
        return 0 ;;
      to_charset )
        COMPREPLY=( $(compgen -W "ASCII" -- ${cur}) )
        return 0 ;;
      content )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      fallback )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  transcode )
    COMPREPLY=( $(compgen -W "content from_charset to_charset discard_illegal transliterate" -- ${cur}) )
    case ${prev} in
      content )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      from_charset )
        COMPREPLY=( $(compgen -W "UTF-8" -- ${cur}) )
        return 0 ;;
      to_charset )
        COMPREPLY=( $(compgen -W "ASCII" -- ${cur}) )
        return 0 ;;
      discard_illegal )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      transliterate )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  upload_files )
    COMPREPLY=( $(compgen -W "dir file file{1..9}" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file{1..9} )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Ftp )
  COMPREPLY=( $(compgen -W "add_ftp allows_anonymous_ftp allows_anonymous_ftp_incoming delete_ftp ftp_exists get_ftp_daemon_info get_port get_quota get_welcome_message kill_session list_ftp list_ftp_with_disk list_sessions passwd server_name set_anonymous_ftp set_anonymous_ftp_incoming set_homedir set_quota set_welcome_message" -- ${cur}) )

  case ${functionName} in

  add_ftp )
    COMPREPLY=( $(compgen -W "user pass homedir quota disallowdot domain pass_hash" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      disallowdot )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      pass_hash )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  allows_anonymous_ftp )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  allows_anonymous_ftp_incoming )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  delete_ftp )
    COMPREPLY=( $(compgen -W "domain user destroy" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_ftpuser)" -- ${cur}) )
        return 0 ;;
      destroy )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  ftp_exists )
    COMPREPLY=( $(compgen -W "domain user" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_ftpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_ftp_daemon_info )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_port )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_quota )
    COMPREPLY=( $(compgen -W "domain user" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_ftpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_welcome_message )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  kill_session )
    COMPREPLY=( $(compgen -W "login" -- ${cur}) )
    case ${prev} in
      login )
        COMPREPLY=( $(compgen -W "$(_uapi_ftpuser all)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_ftp )
    COMPREPLY=( $(compgen -W "skip_acct_types include_acct_types" -- ${cur}) )
    case ${prev} in
      skip_acct_types )
        COMPREPLY=( $(compgen -W "anonymous logaccess main sub" -- ${cur}) )
        return 0 ;;
      include_acct_types )
        COMPREPLY=( $(compgen -W "anonymous logaccess main sub" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_ftp_with_disk )
    COMPREPLY=( $(compgen -W "skip_acct_types include_acct_types" -- ${cur}) )
    case ${prev} in
      skip_acct_types )
        COMPREPLY=( $(compgen -W "anonymous logaccess main sub" -- ${cur}) )
        return 0 ;;
      include_acct_types )
        COMPREPLY=( $(compgen -W "anonymous logaccess main sub" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_sessions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  passwd )
    COMPREPLY=( $(compgen -W "domain user pass" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_ftpuser)" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  server_name )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  set_anonymous_ftp )
    COMPREPLY=( $(compgen -W "set" -- ${cur}) )
    case ${prev} in
      set )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_anonymous_ftp_incoming )
    COMPREPLY=( $(compgen -W "set" -- ${cur}) )
    case ${prev} in
      set )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_homedir )
    COMPREPLY=( $(compgen -W "user domain homedir" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_ftpuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_quota )
    COMPREPLY=( $(compgen -W "user quota kill domain" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_ftpuser)" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      kill )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_welcome_message )
    COMPREPLY=( $(compgen -W "message" -- ${cur}) )
    case ${prev} in
      message )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Integration )
  COMPREPLY=( $(compgen -W "fetch_url" -- ${cur}) )

  case ${functionName} in

  fetch_url )
    COMPREPLY=( $(compgen -W "app" -- ${cur}) )
    case ${prev} in
      app )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

LangPHP )
  COMPREPLY=( $(compgen -W "php_get_domain_handler php_get_impacted_domains php_get_installed_versions php_get_system_default_version php_get_vhost_versions php_ini_get_user_basic_directives php_ini_get_user_content php_ini_get_user_paths php_ini_set_user_basic_directives php_ini_set_user_content php_set_vhost_versions" -- ${cur}) )

  case ${functionName} in

  php_get_domain_handler )
    COMPREPLY=( $(compgen -W "type vhost" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "home vhost" -- ${cur}) )
        return 0 ;;
      vhost )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  php_get_impacted_domains )
    COMPREPLY=( $(compgen -W "system_default domain location" -- ${cur}) )
    case ${prev} in
      system_default )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      location )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  php_get_installed_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  php_get_system_default_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  php_get_vhost_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  php_ini_get_user_basic_directives )
    COMPREPLY=( $(compgen -W "type vhost" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "home vhost" -- ${cur}) )
        return 0 ;;
      vhost )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  php_ini_get_user_content )
    COMPREPLY=( $(compgen -W "type vhost" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "home vhost" -- ${cur}) )
        return 0 ;;
      vhost )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  php_ini_get_user_paths )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  php_ini_set_user_basic_directives )
    COMPREPLY=( $(compgen -W "type vhost directive directive{1..9}" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "home vhost" -- ${cur}) )
        return 0 ;;
      vhost )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      directive )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      directive{1..9} )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  php_ini_set_user_content )
    COMPREPLY=( $(compgen -W "type content vhost" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "home vhost" -- ${cur}) )
        return 0 ;;
      content )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      vhost )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  php_set_vhost_versions )
    COMPREPLY=( $(compgen -W "vhost version" -- ${cur}) )
    case ${prev} in
      vhost )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      version )
        COMPREPLY=( $(compgen -W "$(_uapi_phpversion)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

LastLogin )
  COMPREPLY=( $(compgen -W "get_last_or_current_logged_in_ip" -- ${cur}) )

  case ${functionName} in

  get_last_or_current_logged_in_ip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Locale )
  COMPREPLY=( $(compgen -W "get_attributes" -- ${cur}) )

  case ${functionName} in

  get_attributes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Mailboxes )
  COMPREPLY=( $(compgen -W "expunge_mailbox_messages expunge_messages_for_mailbox_guid get_mailbox_status" -- ${cur}) )

  case ${functionName} in

  expunge_mailbox_messages )
    COMPREPLY=( $(compgen -W "account mailbox query" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser _emailaccount)" -- ${cur}) )
        return 0 ;;
      mailbox )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      query )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  expunge_messages_for_mailbox_guid )
    COMPREPLY=( $(compgen -W "account mailbox_guid query" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser _emailaccount)" -- ${cur}) )
        return 0 ;;
      mailbox_guid )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      query )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_mailbox_status )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_uapi_cpuser _emailaccount)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Market )
  COMPREPLY=( $(compgen -W "cancel_pending_ssl_certificate create_shopping_cart get_all_products get_login_url get_pending_ssl_certificates get_providers_list get_provider_specific_dcv_constraints get_ssl_certificate_if_available process_ssl_pending_queue request_ssl_certificates set_status_of_pending_queue_items set_url_after_checkout validate_login_token" -- ${cur}) )

  case ${functionName} in

  cancel_pending_ssl_certificate )
    COMPREPLY=( $(compgen -W "provider order_item_id" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      order_item_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  create_shopping_cart )
    COMPREPLY=( $(compgen -W "provider access_token url_after_checkout item product_id item_parameter" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      access_token )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      url_after_checkout )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      item )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      product_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      item_parameter )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_all_products )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_login_url )
    COMPREPLY=( $(compgen -W "provider url_after_login" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      url_after_login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_pending_ssl_certificates )
    COMPREPLY=( $(compgen -W "provider" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_providers_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_provider_specific_dcv_constraints )
    COMPREPLY=( $(compgen -W "provider" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_ssl_certificate_if_available )
    COMPREPLY=( $(compgen -W "provider order_item_id" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      order_item_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  process_ssl_pending_queue )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  request_ssl_certificates )
    COMPREPLY=( $(compgen -W "access_token certificate product_id price subject_names validity_period vhost_names provider url_after_checkout identity_verification" -- ${cur}) )
    case ${prev} in
      access_token )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      certificate )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      product_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      price )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      subject_names )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      validity_period )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      vhost_names )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      url_after_checkout )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      identity_verification )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_status_of_pending_queue_items )
    COMPREPLY=( $(compgen -W "provider order_item_id status" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      order_item_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      status )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_url_after_checkout )
    COMPREPLY=( $(compgen -W "provider access_token order_id url_after_checkout" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      access_token )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      order_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      url_after_checkout )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  validate_login_token )
    COMPREPLY=( $(compgen -W "provider login_token url_after_login" -- ${cur}) )
    case ${prev} in
      provider )
        COMPREPLY=( $(compgen -W "$(_uapi_marketProvider)" -- ${cur}) )
        return 0 ;;
      login_token )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      url_after_login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Mime )
  COMPREPLY=( $(compgen -W "add_handler add_hotlink add_mime add_redirect delete_handler delete_hotlink delete_mime delete_redirect list_handlers list_hotlinks list_mime list_redirects redirect_info" -- ${cur}) )

  case ${functionName} in

  add_handler )
    COMPREPLY=( $(compgen -W "extension handler" -- ${cur}) )
    case ${prev} in
      extension )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      handler )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_hotlink )
    COMPREPLY=( $(compgen -W "urls extensions allow_null redirect_url" -- ${cur}) )
    case ${prev} in
      urls )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      extensions )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      allow_null )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      redirect_url )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_mime )
    COMPREPLY=( $(compgen -W "type extension" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      extension )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  add_redirect )
    COMPREPLY=( $(compgen -W "domain src redirect type redirect_wildcard redirect_www" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      src )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      redirect )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "permanent temporary" -- ${cur}) )
        return 0 ;;
      redirect_wildcard )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      redirect_www )
        COMPREPLY=( $(compgen -W "0 1 2" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_handler )
    COMPREPLY=( $(compgen -W "extension" -- ${cur}) )
    case ${prev} in
      extension )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_hotlink )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  delete_mime )
    COMPREPLY=( $(compgen -W "type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_redirect )
    COMPREPLY=( $(compgen -W "domain src redirect" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      src )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      redirect )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_handlers )
    COMPREPLY=( $(compgen -W "type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "system user" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_hotlinks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_mime )
    COMPREPLY=( $(compgen -W "type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "system user" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_redirects )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  redirect_info )
    COMPREPLY=( $(compgen -W "url domain" -- ${cur}) )
    case ${prev} in
      url )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

ModSecurity )
  COMPREPLY=( $(compgen -W "disable_all_domains disable_domains enable_all_domains enable_domains has_modsecurity_installed list_domains" -- ${cur}) )

  case ${functionName} in

  disable_all_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  disable_domains )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_all_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  enable_domains )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  has_modsecurity_installed )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Mysql )
  COMPREPLY=( $(compgen -W "add_host check_database create_database create_user delete_database delete_host delete_user get_privileges_on_database get_restrictions get_server_information locate_server rename_database rename_user repair_database revoke_access_to_database set_password set_privileges_on_database" -- ${cur}) )

  case ${functionName} in

  add_host )
    COMPREPLY=( $(compgen -W "host" -- ${cur}) )
    case ${prev} in
      host )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  check_database )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  create_database )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  create_user )
    COMPREPLY=( $(compgen -W "name password" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_database )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_host )
    COMPREPLY=( $(compgen -W "host" -- ${cur}) )
    case ${prev} in
      host )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_user )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_privileges_on_database )
    COMPREPLY=( $(compgen -W "user database" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      database )
        COMPREPLY=( $(compgen -W "$(_uapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_restrictions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_server_information )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  locate_server )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  rename_database )
    COMPREPLY=( $(compgen -W "oldname newname" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "$(_uapi_dblist)" -- ${cur}) )
        return 0 ;;
      newname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  rename_user )
    COMPREPLY=( $(compgen -W "oldname newname" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "$(_uapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      newname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  repair_database )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "$(_uapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  revoke_access_to_database )
    COMPREPLY=( $(compgen -W "user database" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      database )
        COMPREPLY=( $(compgen -W "$(_uapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_password )
    COMPREPLY=( $(compgen -W "user password" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_privileges_on_database )
    COMPREPLY=( $(compgen -W "user database privileges" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_uapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      database )
        COMPREPLY=( $(compgen -W "$(_uapi_dblist)" -- ${cur}) )
        return 0 ;;
      privileges )
        COMPREPLY=( $(compgen -W "'ALL PRIVILEGES' ALTER 'ALTER ROUTINE' CREATE 'CREATE ROUTINE' 'CREATE TEMPORARY TABLES' 'CREATE VIEW' DELETE DROP EVENT EXECUTE INDEX INSERT 'LOCK TABLES' REFERENCES SELECT 'SHOW VIEW' TRIGGER UPDATE" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Notifications )
  COMPREPLY=( $(compgen -W "get_notifications_count" -- ${cur}) )

  case ${functionName} in

  get_notifications_count )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

NVData )
  COMPREPLY=( $(compgen -W "get set" -- ${cur}) )

  case ${functionName} in

  get )
    COMPREPLY=( $(compgen -W "names" -- ${cur}) )
    case ${prev} in
      names )
        COMPREPLY=( $(compgen -W "$(for x in /home*/$username/.cpanel/nvdata/*; do basename $x; done)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set )
    COMPREPLY=( $(compgen -W "names" -- ${cur}) )
    case ${prev} in
      names )
        COMPREPLY=( $(compgen -W "$(for x in /home*/$username/.cpanel/nvdata/*; do basename $x; done)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Parser )
  COMPREPLY=( $(compgen -W "firstfile_relative_uri" -- ${cur}) )

  case ${functionName} in

  firstfile_relative_uri )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

PassengerApps )
  COMPREPLY=( $(compgen -W "disable_application edit_application enable_application list_applications register_application unregister_application" -- ${cur}) )

  case ${functionName} in

  disable_application )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  edit_application )
    COMPREPLY=( $(compgen -W "name new_name path domain deployment_mode envvar_name envvar_value clear_envvars enabled" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      new_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      deployment_mode )
        COMPREPLY=( $(compgen -W "development production" -- ${cur}) )
        return 0 ;;
      envvar_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      envvar_value )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      clear_envvars )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_application )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_applications )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  register_application )
    COMPREPLY=( $(compgen -W "name path domain deployment_mode envvar_name envvar_value enabled" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      deployment_mode )
        COMPREPLY=( $(compgen -W "development production" -- ${cur}) )
        return 0 ;;
      envvar_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      envvar_value )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  unregister_application )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

PasswdStrength )
  COMPREPLY=( $(compgen -W "get_required_strength" -- ${cur}) )

  case ${functionName} in

  get_required_strength )
    COMPREPLY=( $(compgen -W "app" -- ${cur}) )
    case ${prev} in
      app )
        COMPREPLY=( $(compgen -W "bandmin cpaddons createacct ftp htaccess mysql passwd pop postgres sshkey webdisk virtual" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Postgresql )
  COMPREPLY=( $(compgen -W "create_database create_user delete_database get_restrictions grant_all_privileges rename_database rename_user rename_user_no_password revoke_all_privileges set_password" -- ${cur}) )

  case ${functionName} in

  create_database )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  create_user )
    COMPREPLY=( $(compgen -W "name password" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_database )
    COMPREPLY=( $(compgen -W "name" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_restrictions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  grant_all_privileges )
    COMPREPLY=( $(compgen -W "name database" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      database )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  rename_database )
    COMPREPLY=( $(compgen -W "oldname newname" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      newname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  rename_user )
    COMPREPLY=( $(compgen -W "oldname newname password" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      newname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  rename_user_no_password )
    COMPREPLY=( $(compgen -W "oldname newname" -- ${cur}) )
    case ${prev} in
      oldname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      newname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  revoke_all_privileges )
    COMPREPLY=( $(compgen -W "name database" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      database )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_password )
    COMPREPLY=( $(compgen -W "name password" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Pushbullet )
  COMPREPLY=( $(compgen -W "send_test_message" -- ${cur}) )

  case ${functionName} in

  send_test_message )
    COMPREPLY=( $(compgen -W "access_token" -- ${cur}) )
    case ${prev} in
      access_token )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Quota )
  COMPREPLY=( $(compgen -W "get_quota_info" -- ${cur}) )

  case ${functionName} in

  get_quota_info )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Resellers )
  COMPREPLY=( $(compgen -W "list_accounts" -- ${cur}) )

  case ${functionName} in

  list_accounts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

ResourceUsage )
  COMPREPLY=( $(compgen -W "get_usages" -- ${cur}) )

  case ${functionName} in

  get_usages )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Restore )
  COMPREPLY=( $(compgen -W "directory_listing get_users query_file_info restore_file" -- ${cur}) )

  case ${functionName} in

  directory_listing )
    COMPREPLY=( $(compgen -W "path" -- ${cur}) )
    case ${prev} in
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_users )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  query_file_info )
    COMPREPLY=( $(compgen -W "path fullpath" -- ${cur}) )
    case ${prev} in
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      fullpath )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  restore_file )
    COMPREPLY=( $(compgen -W "backupID path fullpath overwrite" -- ${cur}) )
    case ${prev} in
      backupID )
        COMPREPLY=( $(compgen -W "$(_uapi_backupID)" -- ${cur}) )
        return 0 ;;
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      fullpath )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      overwrite )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Session )
  COMPREPLY=( $(compgen -W "create_temp_user" -- ${cur}) )

  case ${functionName} in

  create_temp_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

SiteTemplates )
  COMPREPLY=( $(compgen -W "list_site_templates list_user_settings publish" -- ${cur}) )

  case ${functionName} in

  list_site_templates )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_user_settings )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  publish )
    COMPREPLY=( $(compgen -W "target docroot source path template" -- ${cur}) )
    case ${prev} in
      target )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      docroot )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      source )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      template )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SpamAssassin )
  COMPREPLY=( $(compgen -W "clear_spam_box get_symbolic_test_names get_user_preferences update_user_preference" -- ${cur}) )

  case ${functionName} in

  clear_spam_box )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_symbolic_test_names )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_user_preferences )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  update_user_preference )
    COMPREPLY=( $(compgen -W "score required_score whitelist_from blacklist_from" -- ${cur}) )
    case ${prev} in
      score )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      required_score )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      whitelist_from )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      blacklist_from )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SSH )
  COMPREPLY=( $(compgen -W "get_port" -- ${cur}) )

  case ${functionName} in

  get_port )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

SSL )
  COMPREPLY=( $(compgen -W "add_autossl_excluded_domains check_shared_cert delete_cert delete_csr delete_key delete_ssl disable_mail_sni enable_mail_sni fetch_best_for_domain fetch_certificates_for_fqdns fetch_cert_info fetch_key_and_cabundle_for_certificate find_certificates_for_key find_csrs_for_key generate_cert generate_csr generate_key get_autossl_excluded_domains get_autossl_pending_queue get_autossl_problems get_cabundle get_cn_name installed_host installed_hosts install_ssl is_autossl_check_in_progress is_mail_sni_supported is_sni_supported list_certs list_csrs list_keys list_ssl_items mail_sni_status rebuild_mail_sni_config rebuildssldb remove_autossl_excluded_domains set_autossl_excluded_domains set_cert_friendly_name set_csr_friendly_name set_key_friendly_name set_primary_ssl set_ssl_share show_cert show_csr show_key start_autossl_check upload_cert upload_key" -- ${cur}) )

  case ${functionName} in

  add_autossl_excluded_domains )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  check_shared_cert )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  delete_cert )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_csr )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_key )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_ssl )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  disable_mail_sni )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  enable_mail_sni )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  fetch_best_for_domain )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  fetch_certificates_for_fqdns )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  fetch_cert_info )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  fetch_key_and_cabundle_for_certificate )
    COMPREPLY=( $(compgen -W "certificate" -- ${cur}) )
    case ${prev} in
      certificate )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  find_certificates_for_key )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  find_csrs_for_key )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  generate_cert )
    COMPREPLY=( $(compgen -W "domains countryName stateOrProvinceName localityName organizationName organizationalUnitName emailAddress key_id friendly_name" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      countryName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      stateOrProvinceName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      localityName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      organizationName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      organizationalUnitName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      emailAddress )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      key_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  generate_csr )
    COMPREPLY=( $(compgen -W "domains countryName stateOrProvinceName localityName organizationName organizationalUnitName emailAddress key_id friendly_name" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      countryName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      stateOrProvinceName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      localityName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      organizationName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      organizationalUnitName )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      emailAddress )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      key_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  generate_key )
    COMPREPLY=( $(compgen -W "keysize friendly_name" -- ${cur}) )
    case ${prev} in
      keysize )
        COMPREPLY=( $(compgen -W "{2048..4096..1024}" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_autossl_excluded_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_autossl_pending_queue )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_autossl_problems )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_cabundle )
    COMPREPLY=( $(compgen -W "cert" -- ${cur}) )
    case ${prev} in
      cert )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_cn_name )
    COMPREPLY=( $(compgen -W "domain service add_mail_subdomain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      service )
        COMPREPLY=( $(compgen -W "cpanel ftp imap pop3 smtp" -- ${cur}) )
        return 0 ;;
      add_mail_subdomain )
        COMPREPLY=( $(compgen -W "mail" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  installed_host )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  installed_hosts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  install_ssl )
    COMPREPLY=( $(compgen -W "domain cert key cabundle" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      cert )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      key )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      cabundle )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  is_autossl_check_in_progress )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  is_mail_sni_supported )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  is_sni_supported )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_certs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_csrs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_keys )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_ssl_items )
    COMPREPLY=( $(compgen -W "domains item" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      item )
        COMPREPLY=( $(compgen -W "key csr crt" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  mail_sni_status )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  rebuild_mail_sni_config )
    COMPREPLY=( $(compgen -W "reload_dovecot" -- ${cur}) )
    case ${prev} in
      reload_dovecot )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  rebuildssldb )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  remove_autossl_excluded_domains )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_autossl_excluded_domains )
    COMPREPLY=( $(compgen -W "domains" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_cert_friendly_name )
    COMPREPLY=( $(compgen -W "friendly_name new_friendly_name" -- ${cur}) )
    case ${prev} in
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      new_friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_csr_friendly_name )
    COMPREPLY=( $(compgen -W "friendly_name new_friendly_name" -- ${cur}) )
    case ${prev} in
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      new_friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_key_friendly_name )
    COMPREPLY=( $(compgen -W "friendly_name new_friendly_name" -- ${cur}) )
    case ${prev} in
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      new_friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_primary_ssl )
    COMPREPLY=( $(compgen -W "servername" -- ${cur}) )
    case ${prev} in
      servername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_ssl_share )
    COMPREPLY=( $(compgen -W "enable" -- ${cur}) )
    case ${prev} in
      enable )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  show_cert )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  show_csr )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  show_key )
    COMPREPLY=( $(compgen -W "id friendly_name" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  start_autossl_check )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  upload_cert )
    COMPREPLY=( $(compgen -W "crt friendly_name" -- ${cur}) )
    case ${prev} in
      crt )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  upload_key )
    COMPREPLY=( $(compgen -W "key friendly_name" -- ${cur}) )
    case ${prev} in
      key )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      friendly_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

StatsBar )
  COMPREPLY=( $(compgen -W "get_stats" -- ${cur}) )

  case ${functionName} in

  get_stats )
    COMPREPLY=( $(compgen -W "display warnings warninglevel warnout infinityimg infinitylang rowcounter" -- ${cur}) )
    case ${prev} in
      display )
        COMPREPLY=( $(compgen -W "ftpaccounts perlversion dedicatedip hostname operatingsystem sendmailpath autoresponders perlpath emailforwarders bandwidthusage emailfilters mailinglists diskusage phpversion sqldatabases apacheversion kernelversion shorthostname parkeddomains cpanelbuild theme addondomains cpanelrevision machinetype cpanelversion mysqldiskusage mysqlversion subdomains postgresdiskusage sharedip hostingpackage emailaccounts" -- ${cur}) )
        return 0 ;;
      warnings )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      warninglevel )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      warnout )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      infinityimg )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      infinitylang )
        COMPREPLY=( $(compgen -W "infinity" -- ${cur}) )
        return 0 ;;
      rowcounter )
        COMPREPLY=( $(compgen -W "odd even" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Styles )
  COMPREPLY=( $(compgen -W "current list set_default update" -- ${cur}) )

  case ${functionName} in

  current )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  set_default )
    COMPREPLY=( $(compgen -W "type name" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "default global reseller" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  update )
    COMPREPLY=( $(compgen -W "type name" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "default global reseller" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Themes )
  COMPREPLY=( $(compgen -W "get_theme_base list update" -- ${cur}) )

  case ${functionName} in

  get_theme_base )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list )
    COMPREPLY=( $(compgen -W "show_mail_themes" -- ${cur}) )
    case ${prev} in
      show_mail_themes )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  update )
    COMPREPLY=( $(compgen -W "theme" -- ${cur}) )
    case ${prev} in
      theme )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

TwoFactorAuth )
  COMPREPLY=( $(compgen -W "generate_user_configuration get_user_configuration remove_user_configuration set_user_configuration" -- ${cur}) )

  case ${functionName} in

  generate_user_configuration )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_user_configuration )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  remove_user_configuration )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  set_user_configuration )
    COMPREPLY=( $(compgen -W "secret tfa_token" -- ${cur}) )
    case ${prev} in
      secret )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      tfa_token )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

UserManager )
  COMPREPLY=( $(compgen -W "check_account_conflicts create_user delete_user dismiss_user edit_user list_users lookup_service_account lookup_user merge_service_account unlink_service_account" -- ${cur}) )

  case ${functionName} in

  check_account_conflicts )
    COMPREPLY=( $(compgen -W "full_username" -- ${cur}) )
    case ${prev} in
      full_username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  create_user )
    COMPREPLY=( $(compgen -W "alternate_email avatar_url domain password phone_number real_name send_invite services.email.enabled services.email.quota services.ftp.enabled services.ftp.homedir services.webdisk.enabled services.webdisk.enabledigest services.webdisk.private services.webdisk.homedir services.webdisk.perms type username" -- ${cur}) )
    case ${prev} in
      alternate_email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      avatar_url )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      phone_number )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      real_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      send_invite )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.email.enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.email.quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      services.ftp.enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.ftp.homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      services.webdisk.enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.enabledigest )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.private )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      services.webdisk.perms )
        COMPREPLY=( $(compgen -W "ro rw" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "sub" -- ${cur}) )
        return 0 ;;
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete_user )
    COMPREPLY=( $(compgen -W "username domain" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  dismiss_user )
    COMPREPLY=( $(compgen -W "username domain services.email.dismiss services.ftp.dismiss services.webdisk.dismiss" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      services.email.dismiss )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.ftp.dismiss )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.dismiss )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  edit_user )
    COMPREPLY=( $(compgen -W "alternate_email avatar_url domain password phone_number real_name send_invite services.email.enabled services.email.quota services.ftp.enabled services.ftp.homedir services.webdisk.enabled services.webdisk.enabledigest services.webdisk.private services.webdisk.homedir services.webdisk.perms type username" -- ${cur}) )
    case ${prev} in
      alternate_email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      avatar_url )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      phone_number )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      real_name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      send_invite )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.email.enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.email.quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      services.ftp.enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.ftp.homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      services.webdisk.enabled )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.enabledigest )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.private )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      services.webdisk.perms )
        COMPREPLY=( $(compgen -W "ro rw" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "sub" -- ${cur}) )
        return 0 ;;
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  list_users )
    COMPREPLY=( $(compgen -W "flat" -- ${cur}) )
    case ${prev} in
      flat )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  lookup_service_account )
    COMPREPLY=( $(compgen -W "type full_username" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "email ftp webdisk" -- ${cur}) )
        return 0 ;;
      full_username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  lookup_user )
    COMPREPLY=( $(compgen -W "guid" -- ${cur}) )
    case ${prev} in
      guid )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  merge_service_account )
    COMPREPLY=( $(compgen -W "username domain services.email.merge services.ftp.merge services.webdisk.merge" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domain_list)" -- ${cur}) )
        return 0 ;;
      services.email.merge )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.ftp.merge )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      services.webdisk.merge )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  unlink_service_account )
    COMPREPLY=( $(compgen -W "username domain service dismiss" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_uapi_domainList)" -- ${cur}) )
        return 0 ;;
      service )
        COMPREPLY=( $(compgen -W "email ftp webdisk" -- ${cur}) )
        return 0 ;;
      dismiss )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

UserTasks )
  COMPREPLY=( $(compgen -W "delete retrieve" -- ${cur}) )

  case ${functionName} in

  delete )
    COMPREPLY=( $(compgen -W "id" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  retrieve )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

VersionControl )
  COMPREPLY=( $(compgen -W "create delete retrieve update" -- ${cur}) )

  case ${functionName} in

  create )
    COMPREPLY=( $(compgen -W "type name repository_root source_repository" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "git" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      repository_root )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      source_repository )
        COMPREPLY=( $(compgen -W "'{{"remote_name"" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete )
    COMPREPLY=( $(compgen -W "repository_root" -- ${cur}) )
    case ${prev} in
      repository_root )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  retrieve )
    COMPREPLY=( $(compgen -W "fields" -- ${cur}) )
    case ${prev} in
      fields )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  update )
    COMPREPLY=( $(compgen -W "repository_root name branch source_repository" -- ${cur}) )
    case ${prev} in
      repository_root )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      branch )
        COMPREPLY=( $(compgen -W "master" -- ${cur}) )
        return 0 ;;
      source_repository )
        COMPREPLY=( $(compgen -W "'{"remote_name"" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

VersionControlDeployment )
  COMPREPLY=( $(compgen -W "create delete retrieve" -- ${cur}) )

  case ${functionName} in

  create )
    COMPREPLY=( $(compgen -W "repository_root" -- ${cur}) )
    case ${prev} in
      repository_root )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  delete )
    COMPREPLY=( $(compgen -W "deploy_id" -- ${cur}) )
    case ${prev} in
      deploy_id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  retrieve )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

WebDisk )
  COMPREPLY=( $(compgen -W "delete_user set_homedir set_password set_permissions" -- ${cur}) )

  case ${functionName} in

  delete_user )
    COMPREPLY=( $(compgen -W "user destroy" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      destroy )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_homedir )
    COMPREPLY=( $(compgen -W "user homedir private" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      private )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_password )
    COMPREPLY=( $(compgen -W "user password enabledigest" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      enabledigest )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  set_permissions )
    COMPREPLY=( $(compgen -W "user perms" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      perms )
        COMPREPLY=( $(compgen -W "ro rw" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

WebmailApps )
  COMPREPLY=( $(compgen -W "listwebmailapps" -- ${cur}) )

  case ${functionName} in

  listwebmailapps )
    COMPREPLY=( $(compgen -W "theme" -- ${cur}) )
    case ${prev} in
      theme )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

WebVhost )
  COMPREPLY=( $(compgen -W "list_domains list_ssl_capable_domains" -- ${cur}) )

  case ${functionName} in

  list_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  list_ssl_capable_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

WordPressInstanceManager )
  COMPREPLY=( $(compgen -W "change_admin_password configure_autoupdate get_api_version get_instance_by_id get_instances get_latest_wordpress_version_from_wordpress_org is_installable_addon_available" -- ${cur}) )

  case ${functionName} in

  change_admin_password )
    COMPREPLY=( $(compgen -W "id password" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  configure_autoupdate )
    COMPREPLY=( $(compgen -W "id autoupdate.core.major autoupdate.core.minor" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      autoupdate.core.major )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      autoupdate.core.minor )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_api_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_instance_by_id )
    COMPREPLY=( $(compgen -W "id" -- ${cur}) )
    case ${prev} in
      id )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  get_instances )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  get_latest_wordpress_version_from_wordpress_org )
    COMPREPLY=( $(compgen -W "force cache_time" -- ${cur}) )
    case ${prev} in
      force )
        COMPREPLY=( $(compgen -W "$(_uapi_boolean)" -- ${cur}) )
        return 0 ;;
      cache_time )
        COMPREPLY=( $(compgen -W "{3600..86400..3600}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

  is_installable_addon_available )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;
