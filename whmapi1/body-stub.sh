abort_transfer_session accesshash accountsummary acctcounts add_configclusterserver adddns addips add_override_features_for_user addpkg addpkgext addzonerecord analyze_transfer_session_remote api_token_create api_token_list api_token_revoke api_token_update applist applist authorizesshkey available_transfer_modules background_mysql_upgrade_status backup_config_get backup_config_set backup_date_list backup_destination_add backup_destination_delete backup_destination_get backup_destination_list backup_destination_set backup_destination_validate backup_set_list backup_skip_users_all backup_skip_users_all_status backup_user_list batch changepackage check_remote_ssh_connection configurebackgroundprocesskiller configureservice convert_addon_fetch_conversion_details convert_addon_fetch_domain_details convert_addon_get_conversion_status convert_addon_initiate_conversion convert_addon_list_addon_domains convert_addon_list_conversions convert_all_domains_to_fpm convert_and_migrate_from_legacy_config convertopensshtoputty cors_proxy_get cpgreylist_is_server_netblock_trusted cpgreylist_list_entries_for_common_mail_provider cpgreylist_load_common_mail_providers_config cpgreylist_save_common_mail_providers_config cpgreylist_status cpgreylist_trust_entries_for_common_mail_provider cpgreylist_untrust_entries_for_common_mail_provider cphulk_status createacct create_cpgreylist_trusted_host create_cphulk_record create_featurelist create_integration_group create_integration_link create_remote_root_transfer_session create_remote_user_transfer_session create_user_session current_mysql_version delete_account_archives delete_configclusterserver delete_cpgreylist_trusted_host delete_cphulk_record delete_featurelist delete_hook delete_rpm_version deletesshkey delip delpkgext disable_authentication_provider disable_autossl disable_cpgreylist disable_cphulk disable_failing_authentication_providers disable_mail_sni disable_market_provider domainuserdata dumpzone ea4_get_currently_installed_packages ea4_get_ea_pkgs_state ea4_list_profiles ea4_migration ea4_pre_migrate_check ea4_recommendations ea4_save_profile edit_hook editpkg editquota edit_rpm_version editzonerecord emailtrack_search emailtrack_stats emailtrack_user_stats enable_authentication_provider enable_cpgreylist enable_cphulk enable_mail_sni enable_market_provider enable_monitor_all_enabled_services enqueue_transfer_item exim_configuration_check expunge_mailbox_messages expunge_messages_for_mailbox_guid fetchcrtinfo fetch_mail_queue fetch_service_ssl_components fetch_ssl_certificates_for_fqdns fetchsslinfo fetch_ssl_vhosts fetch_transfer_session_log fetch_vhost_ssl_components flush_cphulk_login_history flush_cphulk_login_history_for_ips forcepasswordchange generate_cpanel_plugin generate_mobileconfig generatesshkeypair generatessl get_adjusted_market_providers_products get_all_contact_importances get_appconfig_application_list get_application_contact_event_importance get_application_contact_importance get_autossl_check_schedule get_autossl_log get_autossl_logs_catalog get_autossl_pending_queue get_autossl_pending_queue_for_domain get_autossl_pending_queue_for_user get_autossl_problems_for_domain get_autossl_problems_for_user get_autossl_providers get_available_authentication_providers get_available_featurelists get_available_tiers get_best_ssldomain_for_service get_countries_with_known_ip_ranges get_cphulk_brutes get_cphulk_excessive_brutes get_cphulk_failed_logins get_cphulk_user_brutes get_current_lts_expiration_status getdiskusage get_domain_info getfeaturelist get_featurelist_data get_featurelists get_feature_metadata get_feature_names get_fpm_count_and_utilization gethostname get_integration_link_user_config get_login_url getlongtermsupport get_lts_wexpire get_mailbox_status get_mailbox_status_list get_market_providers_commission_config get_market_providers_list get_market_providers_product_metadata get_market_providers_products get_nameserver_config get_password_strength _getpkgextensionform getpkginfo get_provider_client_configurations get_provider_configuration_fields get_provider_display_configurations get_public_contact get_public_ip get_remote_access_hash getresellerips get_rpm_version_data get_service_config get_service_config_key get_shared_ip get_transfer_session_state get_tweaksetting get_update_availability get_user_email_forward_destination get_users_authn_linked_accounts get_users_features_settings get_users_links get_users_with_backup_metadata getzonerecord has_digest_auth has_mycnf_for_cpuser hold_outgoing_email importsshkey installable_mysql_versions installed_versions install_rpm_plugin install_service_ssl_certificate installssl ipv6_disable_account ipv6_enable_account ipv6_range_add ipv6_range_edit ipv6_range_list ipv6_range_remove ipv6_range_usage is_conversion_in_progress is_sni_supported killdns killpkg latest_available_mysql_version limitbw link_user_authn_provider listaccts listacls list_configclusterservers list_cparchive_files listcrts list_databases list_database_users list_hooks list_integration_groups list_integration_links listips listlockedaccounts listmxs list_mysql_databases_and_users listpkgs list_pops_for listresellers list_rpms listsshkeys list_styles listsuspended list_users listzones loadavg load_cpgreylist_config load_cphulk_config load_style lookupnsip lookupnsips mail_sni_status manage_features matchpkgs modifyacct modsec_add_rule modsec_add_vendor modsec_add_vendor modsec_assemble_config_text modsec_batch_settings modsec_check_rule modsec_clone_rule modsec_deploy_all_rule_changes modsec_deploy_rule_changes modsec_deploy_settings_changes modsec_disable_rule modsec_disable_vendor modsec_disable_vendor_configs modsec_disable_vendor_updates modsec_discard_all_rule_changes modsec_discard_rule_changes modsec_edit_rule modsec_enable_vendor modsec_enable_vendor_configs modsec_enable_vendor_configs modsec_enable_vendor_updates modsec_get_configs modsec_get_configs_with_changes_pending modsec_get_config_text modsec_get_log modsec_get_rules modsec_get_settings modsec_get_vendors modsec_get_vendors modsec_is_installed modsec_make_config_active modsec_make_config_inactive modsec_preview_vendor modsec_preview_vendor modsec_remove_rule modsec_remove_setting modsec_remove_vendor modsec_report_rule modsec_set_config_text modsec_set_setting modsec_undisable_rule modsec_update_vendor myprivs nat_checkip nat_set_public_ip nvget nvset package_manager_fixcache package_manager_get_build_log package_manager_get_package_info package_manager_is_performing_actions package_manager_resolve_actions package_manager_submit_actions package_manager_upgrade passwd pause_transfer_session php_get_default_accounts_to_fpm php_get_handlers php_get_impacted_domains php_get_installed_versions php_get_old_fpm_flag php_get_system_default_version php_get_vhosts_by_version php_get_vhost_versions php_ini_get_content php_ini_get_directives php_ini_set_content php_ini_set_directives php_set_default_accounts_to_fpm php_set_handler php_set_old_fpm_flag php_set_session_save_path php_set_system_default_version php_set_vhost_versions purchase_a_license read_cpgreylist_deferred_entries read_cpgreylist_trusted_host read_cphulk_records read_featurelist reboot rebuildinstalledssldb rebuild_mail_sni_config rebuilduserssldb release_outgoing_email remote_basic_credential_check remote_mysql_create_profile remote_mysql_create_profile_via_ssh remote_mysql_delete_profile remote_mysql_initiate_profile_activation remote_mysql_monitor_profile_activation remote_mysql_read_profile remote_mysql_read_profiles remote_mysql_update_profile remote_mysql_validate_profile removeacct remove_in_progress_exim_config_edit remove_integration_group remove_integration_link remove_logo remove_override_features_for_user remove_style removezonerecord rename_mysql_database rename_mysql_user rename_postgresql_database rename_postgresql_user reorder_hooks resellerstats reset_autossl_provider reset_service_ssl_certificate resetzone resolvedomainname restartservice restoreaccount restore_modules_summary restore_queue_activate restore_queue_add_task restore_queue_clear_all_completed_tasks restore_queue_clear_all_failed_tasks restore_queue_clear_all_pending_tasks restore_queue_clear_all_tasks restore_queue_clear_completed_task restore_queue_clear_pending_task restore_queue_is_active restore_queue_list_active restore_queue_list_completed restore_queue_list_pending restore_queue_state retrieve_transfer_session_remote_analysis run_cpkeyclt saveacllist save_cpgreylist_config save_cphulk_config savemxs save_spamd_config save_style send_test_posturl send_test_pushbullet_note servicestatus setacls set_application_contact_event_importance set_application_contact_importance set_autossl_metadata set_autossl_metadata_key set_autossl_provider set_cpanel_updates set_cphulk_config_key set_default set_digest_auth sethostname set_local_mysql_root_password set_market_product_attribute set_market_provider_commission_id setminimumpasswordstrengths set_mysql_password set_postgresql_password set_primary_servername set_provider_client_configurations set_provider_display_configurations set_public_contact setresellerips setresellerlimits setresellermainip setresellernameservers setresellerpackagelimit setresolvers set_service_config_key setsiteip set_tier set_tweaksetting setupreseller set_user_email_forward_destination showbw start_autossl_check_for_all_users start_autossl_check_for_one_user start_background_mysql_upgrade start_background_pkgacct start_transfer_session suspendacct suspend_outgoing_email suspendreseller systemloadavg system_needs_reboot terminatereseller ticket_create_stub_ticket ticket_get_support_agreement ticket_grant ticket_list ticket_remove_closed ticket_revoke ticket_ssh_test ticket_ssh_test_start ticket_update_service_agreement_approval ticket_validate_oauth2_code ticket_whitelist_check ticket_whitelist_setup ticket_whitelist_unsetup toggle_user_backup_state transfer_module_schema twofactorauth_disable_policy twofactorauth_enable_policy twofactorauth_generate_tfa_config twofactorauth_get_issuer twofactorauth_get_user_configs twofactorauth_policy_status twofactorauth_remove_user_config twofactorauth_set_issuer twofactorauth_set_tfa_config uninstall_rpm_plugin unlink_user_authn_provider unsetupreseller unsuspendacct unsuspend_outgoing_email unsuspendreseller untrack_acct_id untrack_acct_id update_configclusterserver update_featurelist update_integration_link_token update_updateconf validate_current_installed_exim_config validate_exim_configuration_syntax validate_login_token validate_system_user verify_aim_access verify_icq_access verify_new_username verify_new_username_for_restore verify_oscar_access verify_posturl_access verify_pushbullet_access verify_user_has_feature version 

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+abort_transfer_session
  abort_transfer_session )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+accesshash
  accesshash )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+accountsummary
  accountsummary )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+acctcounts
  acctcounts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+add_configclusterserver
  add_configclusterserver )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+adddns
  adddns )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addips
  addips )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+add_override_features_for_user
  add_override_features_for_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addpkg
  addpkg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addpkgext
  addpkgext )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+addzonerecord
  addzonerecord )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+analyze_transfer_session_remote
  analyze_transfer_session_remote )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_create
  api_token_create )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_list
  api_token_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_revoke
  api_token_revoke )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+api_token_update
  api_token_update )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+applist
  applist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+applist
  applist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+authorizesshkey
  authorizesshkey )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+available_transfer_modules
  available_transfer_modules )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+background_mysql_upgrade_status
  background_mysql_upgrade_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_config_get
  backup_config_get )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_config_set
  backup_config_set )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_date_list
  backup_date_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_add
  backup_destination_add )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_delete
  backup_destination_delete )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_get
  backup_destination_get )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_list
  backup_destination_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_set
  backup_destination_set )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_destination_validate
  backup_destination_validate )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_set_list
  backup_set_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_skip_users_all
  backup_skip_users_all )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_skip_users_all_status
  backup_skip_users_all_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+backup_user_list
  backup_user_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+batch
  batch )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+changepackage
  changepackage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+check_remote_ssh_connection
  check_remote_ssh_connection )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+configurebackgroundprocesskiller
  configurebackgroundprocesskiller )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+configureservice
  configureservice )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_fetch_conversion_details
  convert_addon_fetch_conversion_details )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_fetch_domain_details
  convert_addon_fetch_domain_details )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_get_conversion_status
  convert_addon_get_conversion_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++convert_addon_initiate_conversion
  convert_addon_initiate_conversion )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+convertopensshtoputty
  convertopensshtoputty )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cors_proxy_get
  cors_proxy_get )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_is_server_netblock_trusted
  cpgreylist_is_server_netblock_trusted )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_list_entries_for_common_mail_provider
  cpgreylist_list_entries_for_common_mail_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_load_common_mail_providers_config
  cpgreylist_load_common_mail_providers_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_save_common_mail_providers_config
  cpgreylist_save_common_mail_providers_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_status
  cpgreylist_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_trust_entries_for_common_mail_provider
  cpgreylist_trust_entries_for_common_mail_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cpgreylist_untrust_entries_for_common_mail_provider
  cpgreylist_untrust_entries_for_common_mail_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+cphulk_status
  cphulk_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+createacct
  createacct )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_cpgreylist_trusted_host
  create_cpgreylist_trusted_host )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_cphulk_record
  create_cphulk_record )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_featurelist
  create_featurelist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_integration_group
  create_integration_group )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_integration_link
  create_integration_link )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_remote_root_transfer_session
  create_remote_root_transfer_session )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_remote_user_transfer_session
  create_remote_user_transfer_session )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+create_user_session
  create_user_session )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+current_mysql_version
  current_mysql_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_account_archives
  delete_account_archives )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_configclusterserver
  delete_configclusterserver )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_cpgreylist_trusted_host
  delete_cpgreylist_trusted_host )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_cphulk_record
  delete_cphulk_record )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_featurelist
  delete_featurelist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_hook
  delete_hook )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delete_rpm_version
  delete_rpm_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+deletesshkey
  deletesshkey )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delip
  delip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+delpkgext
  delpkgext )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_authentication_provider
  disable_authentication_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+disable_market_provider
  disable_market_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+domainuserdata
  domainuserdata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+dumpzone
  dumpzone )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_get_currently_installed_packages
  ea4_get_currently_installed_packages )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_get_ea_pkgs_state
  ea4_get_ea_pkgs_state )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_list_profiles
  ea4_list_profiles )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ea4_migration
  ea4_migration )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+edit_hook
  edit_hook )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+editpkg
  editpkg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+editquota
  editquota )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+edit_rpm_version
  edit_rpm_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+editzonerecord
  editzonerecord )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+emailtrack_search
  emailtrack_search )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+emailtrack_stats
  emailtrack_stats )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+emailtrack_user_stats
  emailtrack_user_stats )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_authentication_provider
  enable_authentication_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_market_provider
  enable_market_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enable_monitor_all_enabled_services
  enable_monitor_all_enabled_services )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+enqueue_transfer_item
  enqueue_transfer_item )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+exim_configuration_check
  exim_configuration_check )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+expunge_mailbox_messages
  expunge_mailbox_messages )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+expunge_messages_for_mailbox_guid
  expunge_messages_for_mailbox_guid )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetchcrtinfo
  fetchcrtinfo )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetchsslinfo
  fetchsslinfo )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_ssl_vhosts
  fetch_ssl_vhosts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+fetch_transfer_session_log
  fetch_transfer_session_log )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+forcepasswordchange
  forcepasswordchange )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generate_cpanel_plugin
  generate_cpanel_plugin )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generate_mobileconfig
  generate_mobileconfig )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generatesshkeypair
  generatesshkeypair )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+generatessl
  generatessl )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_application_contact_importance
  get_application_contact_importance )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_check_schedule
  get_autossl_check_schedule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_log
  get_autossl_log )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_logs_catalog
  get_autossl_logs_catalog )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_pending_queue
  get_autossl_pending_queue )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_pending_queue_for_domain
  get_autossl_pending_queue_for_domain )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_pending_queue_for_user
  get_autossl_pending_queue_for_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_problems_for_domain
  get_autossl_problems_for_domain )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_problems_for_user
  get_autossl_problems_for_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_autossl_providers
  get_autossl_providers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_login_url
  get_login_url )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getlongtermsupport
  getlongtermsupport )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_lts_wexpire
  get_lts_wexpire )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_mailbox_status
  get_mailbox_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_mailbox_status_list
  get_mailbox_status_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+_getpkgextensionform
  _getpkgextensionform )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getpkginfo
  getpkginfo )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_provider_client_configurations
  get_provider_client_configurations )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_provider_configuration_fields
  get_provider_configuration_fields )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_provider_display_configurations
  get_provider_display_configurations )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_public_contact
  get_public_contact )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_public_ip
  get_public_ip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_remote_access_hash
  get_remote_access_hash )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getresellerips
  getresellerips )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_rpm_version_data
  get_rpm_version_data )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_service_config
  get_service_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_service_config_key
  get_service_config_key )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_shared_ip
  get_shared_ip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_transfer_session_state
  get_transfer_session_state )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_tweaksetting
  get_tweaksetting )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_update_availability
  get_update_availability )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_user_email_forward_destination
  get_user_email_forward_destination )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_authn_linked_accounts
  get_users_authn_linked_accounts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_features_settings
  get_users_features_settings )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_links
  get_users_links )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+get_users_with_backup_metadata
  get_users_with_backup_metadata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+getzonerecord
  getzonerecord )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+has_digest_auth
  has_digest_auth )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+has_mycnf_for_cpuser
  has_mycnf_for_cpuser )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+hold_outgoing_email
  hold_outgoing_email )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+importsshkey
  importsshkey )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+installable_mysql_versions
  installable_mysql_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+installed_versions
  installed_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+install_rpm_plugin
  install_rpm_plugin )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+install_service_ssl_certificate
  install_service_ssl_certificate )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+installssl
  installssl )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_disable_account
  ipv6_disable_account )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_enable_account
  ipv6_enable_account )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_add
  ipv6_range_add )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_edit
  ipv6_range_edit )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_list
  ipv6_range_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_remove
  ipv6_range_remove )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ipv6_range_usage
  ipv6_range_usage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+killpkg
  killpkg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+latest_available_mysql_version
  latest_available_mysql_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+limitbw
  limitbw )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+link_user_authn_provider
  link_user_authn_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listaccts
  listaccts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_integration_links
  list_integration_links )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++list_mysql_databases_and_users
  list_mysql_databases_and_users )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listpkgs
  listpkgs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_pops_for
  list_pops_for )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listresellers
  listresellers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+list_rpms
  list_rpms )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+listsshkeys
  listsshkeys )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+lookupnsips
  lookupnsips )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+mail_sni_status
  mail_sni_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+manage_features
  manage_features )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+matchpkgs
  matchpkgs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modifyacct
  modifyacct )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_add_rule
  modsec_add_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_add_vendor
  modsec_add_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_add_vendor
  modsec_add_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_assemble_config_text
  modsec_assemble_config_text )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_batch_settings
  modsec_batch_settings )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_check_rule
  modsec_check_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_clone_rule
  modsec_clone_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_deploy_all_rule_changes
  modsec_deploy_all_rule_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_deploy_rule_changes
  modsec_deploy_rule_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_deploy_settings_changes
  modsec_deploy_settings_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_rule
  modsec_disable_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_vendor
  modsec_disable_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_vendor_configs
  modsec_disable_vendor_configs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_disable_vendor_updates
  modsec_disable_vendor_updates )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_discard_all_rule_changes
  modsec_discard_all_rule_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_discard_rule_changes
  modsec_discard_rule_changes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_edit_rule
  modsec_edit_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_enable_vendor
  modsec_enable_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_enable_vendor_configs
  modsec_enable_vendor_configs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_enable_vendor_configs
  modsec_enable_vendor_configs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_enable_vendor_updates
  modsec_enable_vendor_updates )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_log
  modsec_get_log )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_rules
  modsec_get_rules )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_settings
  modsec_get_settings )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_get_vendors
  modsec_get_vendors )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_make_config_inactive
  modsec_make_config_inactive )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_preview_vendor
  modsec_preview_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_preview_vendor
  modsec_preview_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_remove_rule
  modsec_remove_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_remove_setting
  modsec_remove_setting )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_remove_vendor
  modsec_remove_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_report_rule
  modsec_report_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_set_config_text
  modsec_set_config_text )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_set_setting
  modsec_set_setting )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_undisable_rule
  modsec_undisable_rule )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+modsec_update_vendor
  modsec_update_vendor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+myprivs
  myprivs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nat_checkip
  nat_checkip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nat_set_public_ip
  nat_set_public_ip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nvget
  nvget )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+nvset
  nvset )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_fixcache
  package_manager_fixcache )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_get_build_log
  package_manager_get_build_log )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_get_package_info
  package_manager_get_package_info )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_is_performing_actions
  package_manager_is_performing_actions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_resolve_actions
  package_manager_resolve_actions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_submit_actions
  package_manager_submit_actions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+package_manager_upgrade
  package_manager_upgrade )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+passwd
  passwd )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+pause_transfer_session
  pause_transfer_session )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_default_accounts_to_fpm
  php_get_default_accounts_to_fpm )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_handlers
  php_get_handlers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_impacted_domains
  php_get_impacted_domains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_get_vhost_versions
  php_get_vhost_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_get_content
  php_ini_get_content )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_get_directives
  php_ini_get_directives )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_set_content
  php_ini_set_content )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_ini_set_directives
  php_ini_set_directives )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_default_accounts_to_fpm
  php_set_default_accounts_to_fpm )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_handler
  php_set_handler )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_old_fpm_flag
  php_set_old_fpm_flag )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_session_save_path
  php_set_session_save_path )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_system_default_version
  php_set_system_default_version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+php_set_vhost_versions
  php_set_vhost_versions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+purchase_a_license
  purchase_a_license )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_cpgreylist_deferred_entries
  read_cpgreylist_deferred_entries )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_cpgreylist_trusted_host
  read_cpgreylist_trusted_host )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_cphulk_records
  read_cphulk_records )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+read_featurelist
  read_featurelist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reboot
  reboot )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rebuildinstalledssldb
  rebuildinstalledssldb )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rebuild_mail_sni_config
  rebuild_mail_sni_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rebuilduserssldb
  rebuilduserssldb )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+release_outgoing_email
  release_outgoing_email )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_basic_credential_check
  remote_basic_credential_check )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_create_profile
  remote_mysql_create_profile )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_create_profile_via_ssh
  remote_mysql_create_profile_via_ssh )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_delete_profile
  remote_mysql_delete_profile )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_initiate_profile_activation
  remote_mysql_initiate_profile_activation )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_monitor_profile_activation
  remote_mysql_monitor_profile_activation )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_read_profile
  remote_mysql_read_profile )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_read_profiles
  remote_mysql_read_profiles )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_update_profile
  remote_mysql_update_profile )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remote_mysql_validate_profile
  remote_mysql_validate_profile )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+removeacct
  removeacct )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_in_progress_exim_config_edit
  remove_in_progress_exim_config_edit )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_integration_group
  remove_integration_group )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_integration_link
  remove_integration_link )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_logo
  remove_logo )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_override_features_for_user
  remove_override_features_for_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+remove_style
  remove_style )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+removezonerecord
  removezonerecord )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_mysql_database
  rename_mysql_database )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_mysql_user
  rename_mysql_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_postgresql_database
  rename_postgresql_database )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+rename_postgresql_user
  rename_postgresql_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reorder_hooks
  reorder_hooks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+resellerstats
  resellerstats )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reset_autossl_provider
  reset_autossl_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+reset_service_ssl_certificate
  reset_service_ssl_certificate )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+resetzone
  resetzone )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+resolvedomainname
  resolvedomainname )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restartservice
  restartservice )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restoreaccount
  restoreaccount )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+restore_queue_clear_pending_task
  restore_queue_clear_pending_task )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+run_cpkeyclt
  run_cpkeyclt )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+saveacllist
  saveacllist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_cpgreylist_config
  save_cpgreylist_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_cphulk_config
  save_cphulk_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+savemxs
  savemxs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_spamd_config
  save_spamd_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+save_style
  save_style )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+send_test_posturl
  send_test_posturl )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+send_test_pushbullet_note
  send_test_pushbullet_note )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+servicestatus
  servicestatus )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setacls
  setacls )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_application_contact_event_importance
  set_application_contact_event_importance )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_application_contact_importance
  set_application_contact_importance )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_autossl_metadata
  set_autossl_metadata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_autossl_metadata_key
  set_autossl_metadata_key )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_autossl_provider
  set_autossl_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_cpanel_updates
  set_cpanel_updates )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_cphulk_config_key
  set_cphulk_config_key )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_default
  set_default )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_digest_auth
  set_digest_auth )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+sethostname
  sethostname )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_local_mysql_root_password
  set_local_mysql_root_password )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_market_product_attribute
  set_market_product_attribute )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_market_provider_commission_id
  set_market_provider_commission_id )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setminimumpasswordstrengths
  setminimumpasswordstrengths )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_mysql_password
  set_mysql_password )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_postgresql_password
  set_postgresql_password )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_primary_servername
  set_primary_servername )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_provider_client_configurations
  set_provider_client_configurations )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_provider_display_configurations
  set_provider_display_configurations )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_public_contact
  set_public_contact )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellerips
  setresellerips )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellerlimits
  setresellerlimits )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellermainip
  setresellermainip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellernameservers
  setresellernameservers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresellerpackagelimit
  setresellerpackagelimit )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setresolvers
  setresolvers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_service_config_key
  set_service_config_key )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setsiteip
  setsiteip )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_tier
  set_tier )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_tweaksetting
  set_tweaksetting )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+setupreseller
  setupreseller )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+set_user_email_forward_destination
  set_user_email_forward_destination )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+showbw
  showbw )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_autossl_check_for_all_users
  start_autossl_check_for_all_users )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_autossl_check_for_one_user
  start_autossl_check_for_one_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_background_mysql_upgrade
  start_background_mysql_upgrade )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_background_pkgacct
  start_background_pkgacct )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+start_transfer_session
  start_transfer_session )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+suspendacct
  suspendacct )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+suspend_outgoing_email
  suspend_outgoing_email )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+suspendreseller
  suspendreseller )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_list
  ticket_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_remove_closed
  ticket_remove_closed )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_revoke
  ticket_revoke )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_ssh_test
  ticket_ssh_test )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++ticket_ssh_test_start
  ticket_ssh_test_start )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_update_service_agreement_approval
  ticket_update_service_agreement_approval )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+ticket_validate_oauth2_code
  ticket_validate_oauth2_code )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+transfer_module_schema
  transfer_module_schema )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_policy_status
  twofactorauth_policy_status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_remove_user_config
  twofactorauth_remove_user_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_set_issuer
  twofactorauth_set_issuer )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+twofactorauth_set_tfa_config
  twofactorauth_set_tfa_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+uninstall_rpm_plugin
  uninstall_rpm_plugin )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unlink_user_authn_provider
  unlink_user_authn_provider )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsetupreseller
  unsetupreseller )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsuspendacct
  unsuspendacct )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsuspend_outgoing_email
  unsuspend_outgoing_email )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+unsuspendreseller
  unsuspendreseller )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++untrack_acct_id
  untrack_acct_id )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-++untrack_acct_id
  untrack_acct_id )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_configclusterserver
  update_configclusterserver )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_featurelist
  update_featurelist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_integration_link_token
  update_integration_link_token )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+update_updateconf
  update_updateconf )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_current_installed_exim_config
  validate_current_installed_exim_config )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_exim_configuration_syntax
  validate_exim_configuration_syntax )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_login_token
  validate_login_token )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+validate_system_user
  validate_system_user )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_new_username_for_restore
  verify_new_username_for_restore )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+verify_oscar_access
  verify_oscar_access )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
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
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

  # https://documentation.cpanel.net/display/DD/WHM+API+1+Functions+-+version
  version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
