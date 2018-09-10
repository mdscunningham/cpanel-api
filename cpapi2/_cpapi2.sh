#!/bin/bash
#                                                          +----+----+----+----+
#                                                          |    |    |    |    |
# Author: Mark David Scott Cunningham                      | M  | D  | S  | C  |
#                                                          +----+----+----+----+
# Created: 2016-06-21
# Updated: 2018-09-09
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

_cpapi_emailAddress(){
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
    opts="--help --output --user AddonDomain Backups Bandwidth Boxtrapper Branding Contactus Cron CSVImport CustInfo DBmap DenyIp DiskCounter DiskUsage DKIMUI DnsLookup DomainLookup Email EmailTrack Encoding Fileman ForcePassword Frontpage FSTest Ftp Gpg Htaccess HttpUtils ImageManager LangMods LeechProtect Locale Logaholic LVEInfo Mime MysqlFE MysqlOptimizer Net News NVData Park Passwd PasswdStrength PHPINI Postgres Rand Resellers RoR SetLang SourceIPCheck SPFUI SSH SSL SSLInfo Statcache Stats StatsBar SubDomain Themes UI UserHttpUtils WebDisk WebmailApps ZoneEdit"

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
AddonDomain )
  COMPREPLY=( $(compgen -W "addaddondomain deladdondomain listaddondomains" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+AddonDomain::addaddondomain
  addaddondomain )
    COMPREPLY=( $(compgen -W "dir newdomain subdomain" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      newdomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      subdomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+AddonDomain::deladdondomain
  deladdondomain )
    COMPREPLY=( $(compgen -W "domain subdomain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      subdomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+AddonDomain::listaddondomain
  listaddondomains )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Backups )
  COMPREPLY=( $(compgen -W "listfullbackups" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Backups::listfullbackups
  listfullbackups )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Bandwidth )
  COMPREPLY=( $(compgen -W "addhttpbandwidth getbwdata gethourlyaveragebwoveryear" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Bandwidth::addhttpbandwidth
  addhttpbandwidth )
    COMPREPLY=( $(compgen -W "bytes domain" -- ${cur}) )
    case ${prev} in
      bytes )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Bandwidth::getbwdata
  getbwdata )
    COMPREPLY=( $(compgen -W "types dataset cf resolution" -- ${cur}) )
    case ${prev} in
      types )
        COMPREPLY=( $(compgen -W "http ftp smtp pop3 imap all" -- ${cur}) )
        return 0 ;;
      dataset )
        COMPREPLY=( $(compgen -W "peak rate" -- ${cur}) )
        return 0 ;;
      cf )
        COMPREPLY=( $(compgen -W "AVERAGE MIN MAX LAST" -- ${cur}) )
        return 0 ;;
      resolution )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Bandwidth::gethourlyaveragebwoveryear
  gethourlyaveragebwoveryear )
    COMPREPLY=( $(compgen -W "types cf" -- ${cur}) )
    case ${prev} in
      types )
        COMPREPLY=( $(compgen -W "http ftp smtp pop3 imap all" -- ${cur}) )
        return 0 ;;
      cf )
        COMPREPLY=( $(compgen -W "AVERAGE MIN MAX LAST" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Boxtrapper )
  COMPREPLY=( $(compgen -W "accountmanagelist" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+BoxTrapper::accountmanagelist
  accountmanagelist )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Branding )
  COMPREPLY=( $(compgen -W "addbrandingobj applist brandingeditor createpkg cssmerge delbrandingobj delpkg gensprites getbrandingpkg getbrandingpkgstatus getdefaultbrandingpkg installbrandingpkgs installimages killimgs listimgtypes listobjecttypes preloadconf resetall resetcss resethtml resolve_file resolvelocalcss savelocalcss setbrandingpkgstatus showpkgs" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::addbrandingobj
  addbrandingobj )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::applist
  applist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::brandingeditor
  brandingeditor )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::createpkg
  createpkg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::cssmerge
  cssmerge )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::delbrandingobj
  delbrandingobj )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::delpkg
  delpkg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::gensprites
  gensprites )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::getbrandingpkg
  getbrandingpkg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::getbrandingpkgstatus
  getbrandingpkgstatus )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::getdefaultbrandingpkg
  getdefaultbrandingpkg )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::installbrandingpkgs
  installbrandingpkgs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::installimages
  installimages )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::killimgs
  killimgs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::listimgtypes
  listimgtypes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::listobjecttypes
  listobjecttypes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::preloadconf
  preloadconf )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::resetall
  resetall )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::resetcss
  resetcss )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::resethtml
  resethtml )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::resolve_file
  resolve_file )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::resolvelocalcss
  resolvelocalcss )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::savelocalcss
  savelocalcss )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::setbrandingpkgstatus
  setbrandingpkgstatus )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Branding::showpkgs
  showpkgs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Contactus )
  COMPREPLY=( $(compgen -W "isenabled sendcontact" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Contactus::isenabled
  isenabled )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Contactus::sendcontact
  sendcontact )
    COMPREPLY=( $(compgen -W "email issue subject" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      issue )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      subject )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Cron )
  COMPREPLY=( $(compgen -W "add_line edit_line fetchcron get_email listcron remove_line set_email" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Cron::add_line
  add_line )
    COMPREPLY=( $(compgen -W "weekday minute hour day month command" -- ${cur}) )
    case ${prev} in
      weekday )
        COMPREPLY=( $(compgen -W "{0..7}" -- ${cur}) )
        return 0 ;;
      minute )
        COMPREPLY=( $(compgen -W "{0..59}" -- ${cur}) )
        return 0 ;;
      hour )
        COMPREPLY=( $(compgen -W "{0..26}" -- ${cur}) )
        return 0 ;;
      day )
        COMPREPLY=( $(compgen -W "{1..31}" -- ${cur}) )
        return 0 ;;
      month )
        COMPREPLY=( $(compgen -W "{1..12}" -- ${cur}) )
        return 0 ;;
      command )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Cron::edit_line
  edit_line )
    COMPREPLY=( $(compgen -W "commandlinenumber linekey weekday minute hour day month command" -- ${cur}) )
    case ${prev} in
      commandlinenumber )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      linekey )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      weekday )
        COMPREPLY=( $(compgen -W "{0..7}" -- ${cur}) )
        return 0 ;;
      minute )
        COMPREPLY=( $(compgen -W "{0..59}" -- ${cur}) )
        return 0 ;;
      hour )
        COMPREPLY=( $(compgen -W "{0..26}" -- ${cur}) )
        return 0 ;;
      day )
        COMPREPLY=( $(compgen -W "{1..31}" -- ${cur}) )
        return 0 ;;
      month )
        COMPREPLY=( $(compgen -W "{1..12}" -- ${cur}) )
        return 0 ;;
      command )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Cron::fetchcron
  fetchcron )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Cron::get_email
  get_email )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Cron::listcron
  listcron )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Cron::remove_line
  remove_line )
    COMPREPLY=( $(compgen -W "line" -- ${cur}) )
    case ${prev} in
      line )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Cron::set_email
  set_email )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

CSVImport )
  COMPREPLY=( $(compgen -W "columnchoices configimport data fetchimportdata isenabled loaddata processdata sendcontact uploadimport" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::columnchoices
  columnchoices )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::configimport
  configimport )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::data
  data )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::fetchimportdata
  fetchimportdata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::isenabled
  isenabled )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::loaddata
  loaddata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::processdata
  processdata )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::sendcontact
  sendcontact )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CSVImport::uploadimport
  uploadimport )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

CustInfo )
  COMPREPLY=( $(compgen -W "contactemails contactprefs displaycontactinfo savecontactinfo" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CustInfo::contactemails
  contactemails )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CustInfo::contactprefs
  contactprefs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CustInfo::displaycontactinfo
  displaycontactinfo )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+CustInfo::savecontactinfo
  savecontactinfo )
    COMPREPLY=( $(compgen -W "email second_email notify_account_authn_link notify_account_authn_link_notification_disabled notify_account_login notify_account_login_for_known_netblock notify_account_login_notification_disabled notify_autossl_expiry notify_autossl_expiry_coverage notify_autossl_renewal_coverage_reduced notify_autossl_renewal notify_autossl_renewal_coverage notify_bandwidth_limit notify_contact_address_change notify_contact_address_change_notification_disabled notify_disk_limit notify_email_quota_limit notify_password_change notify_password_change_notification_disabled notify_ssl_expiry notify_twofactorauth_change notify_twofactorauth_change_notification_disabled pushbullet_access_token username" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      second_email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      notify_account_authn_link )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_account_authn_link_notification_disabled )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_account_login )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_account_login_for_known_netblock )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_account_login_notification_disabled )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_autossl_expiry )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_autossl_expiry_coverage )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_autossl_renewal_coverage_reduced )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_autossl_renewal )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_autossl_renewal_coverage )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_bandwidth_limit )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_contact_address_change )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_contact_address_change_notification_disabled )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_disk_limit )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_email_quota_limit )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_password_change )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_password_change_notification_disabled )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_ssl_expiry )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_twofactorauth_change )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      notify_twofactorauth_change_notification_disabled )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      pushbullet_access_token )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      username )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

DBmap )
  COMPREPLY=( $(compgen -W "status version" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DBmap::status
  status )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DBmap::version
  version )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

DenyIp )
  COMPREPLY=( $(compgen -W "listdenyips" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DenyIp::listdenyips
  listdenyips )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

DiskCounter )
  COMPREPLY=( $(compgen -W "disk_counter" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DiskCounter::disk_counter
  disk_counter )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

DiskUsage )
  COMPREPLY=( $(compgen -W "buildcache clearcache fetchdiskusage fetchdiskusagewithextras fetch_raw_disk_usage" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DiskUsage::buildcache
  buildcache )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DiskUsage::clearcache
  clearcache )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DiskUsage::fetchdiskusage
  fetchdiskusage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DiskUsage::fetchdiskusagewithextras
  fetchdiskusagewithextras )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DiskUsage::fetch_raw_disk_usage
  fetch_raw_disk_usage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

DKIMUI )
  COMPREPLY=( $(compgen -W "available getrecords install installed uninstall" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DKIMUI::available
  available )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DKIMUI::getrecords
  getrecords )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DKIMUI::install
  install )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DKIMUI::installed
  installed )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DKIMUI::uninstall
  uninstall )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

DnsLookup )
  COMPREPLY=( $(compgen -W "name2ip" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DnsLookup::name2ip
  name2ip )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

DomainLookup )
  COMPREPLY=( $(compgen -W "countbaseddomains getbasedomains getdocroot getdocroots getmaindomain" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DomainLookup::countbaseddomains
  countbaseddomains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DomainLookup::getbasedomains
  getbasedomains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DomainLookup::getdocroot
  getdocroot )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DomainLookup::getdocroots
  getdocroots )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+DomainLookup::getmaindomain
  getmaindomain )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Email )
  COMPREPLY=( $(compgen -W "accountname adddomainforward addforward addmx addpop browseboxes changemx checkmaindiscard clearpopcache deletefilter delforward delmx delpop disablefilter editquota enablefilter fetchautoresponder fetchcharmaps filteractions filterlist filtername filterrules getabsbrowsedir getalwaysaccept get_archiving_configuration get_archiving_default_configuration get_archiving_types get_default_email_quota getdiskusage get_email_signing get_max_email_quota getmxcheck has_delegated_mailman_lists listaliasbackups listautoresponders listdefaultaddresses listdomainforwards listfilterbackups listfilters listforwards listlists listmaildomains listmx listmxs listpops listpopssingle listpopswithdisk listpopswithimage list_system_filter_info loadfilter passwdpop reorderfilters setalwaysaccept set_archiving_configuration set_archiving_default_configuration setdefaultaddress set_email_signing setmxcheck storefilter tracefilter" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::accountname
  accountname )
    COMPREPLY=( $(compgen -W "account display" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      display )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::adddomainforward
  adddomainforward )
    COMPREPLY=( $(compgen -W "domain destdomain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      destdomain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https:://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::addforward
  addforward )
    COMPREPLY=( $(compgen -W "domain email fwdopt fwdemail fwdsystem failmsgs pipefwd" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      fwdopt )
        COMPREPLY=( $(compgen -W "fwd fail blackhole pipe system" -- ${cur}) )
        return 0 ;;
      fwdemail )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      fwdsystem )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      failmsgs )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pipefwd )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::addmx
  addmx )
    COMPREPLY=( $(compgen -W "alwaysaccept domain exchange newmx exchanger oldexchange oldmx oldexchanger oldpreference oldpriority preference priority" -- ${cur}) )
    case ${prev} in
      alwaysaccept )
        COMPREPLY=( $(compgen -W "auto local secondary remote" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      exchange|newmx|exchanger )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      oldexchange|oldmx|oldexchanger )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      oldpreference|oldpriority )
        COMPREPLY=( $(compgen -W "{0..25..5}" -- ${cur}) )
        return 0 ;;
      preference|priority )
        COMPREPLY=( $(compgen -W "{0..25..5}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::addpop
  addpop )
    COMPREPLY=( $(compgen -W "domain email password quota send_welcome_email" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      send_welcome_email )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::browseboxes
  browseboxes )
    COMPREPLY=( $(compgen -W "account dir showdotfiles" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      showdotfiles )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::changemx
  changemx )
    COMPREPLY=( $(compgen -W "alwaysaccept domain exchange oldexchange oldpreference preference" -- ${cur}) )
    case ${prev} in
      alwaysaccept )
        COMPREPLY=( $(compgen -W "auto local secondary remote" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      exchange )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      oldexchange )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      oldpreference )
        COMPREPLY=( $(compgen -W "{0..25..5}" -- ${cur}) )
        return 0 ;;
      preference )
        COMPREPLY=( $(compgen -W "{0..25..5}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::checkmaindiscard
  checkmaindiscard )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::clearpopcache
  clearpopcache )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailUser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::deletefilter
  deletefilter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "$(_cpapi_filterList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::delforward
  delforward )
    COMPREPLY=( $(compgen -W "email emaildest" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      emaildest )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::delmx
  delmx )
    COMPREPLY=( $(compgen -W "domain exchange preference" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      exchange )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      preference )
        COMPREPLY=( $(compgen -W "{0..25..5}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::delpop
  delpop )
    COMPREPLY=( $(compgen -W "domain email" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::disablefilter
  disablefilter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "$(_cpapi_filterList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::editquota
  editquota )
    COMPREPLY=( $(compgen -W "domain email quota" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailuser)" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::enablefilter
  enablefilter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "$(_cpapi_filterList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::fetchautoresponder
  fetchautoresponder )
    COMPREPLY=( $(compgen -W "email" -- ${cur}) )
    case ${prev} in
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::fetchcharmaps
  fetchcharmaps )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::filteractions
  filteractions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::filterlist
  filterlist )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::filtername
  filtername )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::filterrules
  filterrules )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::getabsbrowsedir
  getabsbrowsedir )
    COMPREPLY=( $(compgen -W "accout dir" -- ${cur}) )
    case ${prev} in
      accout )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::getalwaysaccept
  getalwaysaccept )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::get_archiving_configuration
  get_archiving_configuration )
    COMPREPLY=( $(compgen -W "domain regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::get_archiving_default_configuration
  get_archiving_default_configuration )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::get_archiving_types
  get_archiving_types )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::get_default_email_quota
  get_default_email_quota )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::getdiskusage
  getdiskusage )
    COMPREPLY=( $(compgen -W "domain user" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::get_email_signing
  get_email_signing )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::get_max_email_quota
  get_max_email_quota )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::getmxcheck
  getmxcheck )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::has_delegated_mailman_lists
  has_delegated_mailman_lists )
    COMPREPLY=( $(compgen -W "delegate" -- ${cur}) )
    case ${prev} in
      delegate )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listaliasbackups
  listaliasbackups )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listautoresponders
  listautoresponders )
    COMPREPLY=( $(compgen -W "domain regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listdefaultaddresses
  listdefaultaddresses )
    COMPREPLY=( $(compgen -W "domain user" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listdomainforwards
  listdomainforwards )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listfilterbackups
  listfilterbackups )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listfilters
  listfilters )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listforwards
  listforwards )
    COMPREPLY=( $(compgen -W "domain regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listlists
  listlists )
    COMPREPLY=( $(compgen -W "domain regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listmaildomains
  listmaildomains )
    COMPREPLY=( $(compgen -W "skipmain" -- ${cur}) )
    case ${prev} in
      skipmain )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listmx
  listmx )
    COMPREPLY=( $(compgen -W "user domain" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listmxs
  listmxs )
    COMPREPLY=( $(compgen -W "user domain" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listpops
  listpops )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listpopssingle
  listpopssingle )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listpopswithdisk
  listpopswithdisk )
    COMPREPLY=( $(compgen -W "domain nearquotaonly novalidate regex" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      nearquotaonly )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      novalidate )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::listpopswithimage
  listpopswithimage )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::list_system_filter_info
  list_system_filter_info )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::loadfilter
  loadfilter )
    COMPREPLY=( $(compgen -W "filtername account" -- ${cur}) )
    case ${prev} in
      filtername )
        COMPREPLY=( $(compgen -W "$(_cpapi_filterList)" -- ${cur}) )
        return 0 ;;
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::passwdpop
  passwdpop )
    COMPREPLY=( $(compgen -W "domain email password" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailuser)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::reorderfilters
  reorderfilters )
    COMPREPLY=( $(compgen -W "mailbox filter{1..10}" -- ${cur}) )
    case ${prev} in
      mailbox )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      filter* )
        COMPREPLY=( $(compgen -W "$(_cpapi_filterList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::setalwaysaccept
  setalwaysaccept )
    COMPREPLY=( $(compgen -W "domain mxcheck user" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      mxcheck )
        COMPREPLY=( $(compgen -W "auto local secondary remote" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuer)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::set_archiving_configuration
  set_archiving_configuration )
    COMPREPLY=( $(compgen -W "domain incoming outgoing mailman" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      incoming )
        COMPREPLY=( $(compgen -W "{0..365..7}" -- ${cur}) )
        return 0 ;;
      outgoing )
        COMPREPLY=( $(compgen -W "{0..365..7}" -- ${cur}) )
        return 0 ;;
      mailman )
        COMPREPLY=( $(compgen -W "{0..365..7}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::set_archiving_default_configuration
  set_archiving_default_configuration )
    COMPREPLY=( $(compgen -W "incoming outgoing mailman" -- ${cur}) )
    case ${prev} in
      incoming )
        COMPREPLY=( $(compgen -W "-1 {0..365..7}" -- ${cur}) )
        return 0 ;;
      outgoing )
        COMPREPLY=( $(compgen -W "-1 {0..365..7}" -- ${cur}) )
        return 0 ;;
      mailman )
        COMPREPLY=( $(compgen -W "-1 {0..365..7}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::setdefaultaddress
  setdefaultaddress )
    COMPREPLY=( $(compgen -W "domain fwdopt fwdemail failmsg pipefwd" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      fwdopt )
        COMPREPLY=( $(compgen -W "fwd fail blackhole pipe" -- ${cur}) )
        return 0 ;;
      fwdemail )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      failmsg )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pipefwd )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::set_email_signing
  set_email_signing )
    COMPREPLY=( $(compgen -W "dkim" -- ${cur}) )
    case ${prev} in
      dkim )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::setmxcheck
  setmxcheck )
    COMPREPLY=( $(compgen -W "domain mxcheck" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainList)" -- ${cur}) )
        return 0 ;;
      mxcheck )
        COMPREPLY=( $(compgen -W "auto local secondary remote" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::storefilter
  storefilter )
    COMPREPLY=( $(compgen -W "account filtername oldfiltername action{1..10} dest{1..10} match{1..10} opt{1..10} part{1..10} val{1..10}" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      oldfiltername )
        COMPREPLY=( $(compgen -W "$(_cpapi_filterList)" -- ${cur}) )
        return 0 ;;
      action* )
        COMPREPLY=( $(compgen -W "deliver fail finish save pipe" -- ${cur}) )
        return 0 ;;
      dest* )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      match* )
        COMPREPLY=( $(compgen -W "is matches contains does%20no%contain begins does%20not%20begin ends does%20not$%20end does%20not$20match is%20above is%20not%above is%20below is%20not%20below" -- ${cur}) )
        return 0 ;;
      opt* )
        COMPREPLY=( $(compgen -W "and or" -- ${cur}) )
        return 0 ;;
      part* )
        COMPREPLY=( $(compgen -W "$header_from $header_subject $header_to $reply_address $message_body $message_headers foranyaddress $h_to $h_cc not%20delivered" -- ${cur}) )
        return 0 ;;
      val* )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Email::tracefilter
  tracefilter )
    COMPREPLY=( $(compgen -W "account filtername" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      filtername )
        COMPREPLY=( $(compgen -W "$(_cpapi_filterList)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

EmailTrack )
  COMPREPLY=( $(compgen -W "search stats trace" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+EmailTrack::search
  search )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+EmailTrack::stats
  stats )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+EmailTrack::trace
  trace )
    COMPREPLY=( $(compgen -W "address" -- ${cur}) )
    case ${prev} in
      address )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Encoding )
  COMPREPLY=( $(compgen -W "get_encodings guess_file guess_file_opts" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Encoding::get_encodings
  get_encodings )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Encoding::guess_file
  guess_file )
    COMPREPLY=( $(compgen -W "file" -- ${cur}) )
    case ${prev} in
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Encoding::guess_file_opts
  guess_file_opts )
    COMPREPLY=( $(compgen -W "file" -- ${cur}) )
    case ${prev} in
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Fileman )
  COMPREPLY=( $(compgen -W "autocompletedir fileop getabsdir getdir getdiractions getdiskinfo getedittype getfileactions getpath listfiles mkdir mkfile savefile search statfiles uploadfiles viewfile" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::autocompletedir
  autocompletedir )
    COMPREPLY=( $(compgen -W "dirsonly path" -- ${cur}) )
    case ${prev} in
      dirsonly )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::fileop
  fileop )
    COMPREPLY=( $(compgen -W "op sourcefiles destfiles doubledecode metadata" -- ${cur}) )
    case ${prev} in
      op )
        COMPREPLY=( $(compgen -W "copy move rename chmod extract compress link unlink trash" -- ${cur}) )
        return 0 ;;
      sourcefiles )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      destfiles )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      doubledecode )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      metadata )
        COMPREPLY=( $(compgen -W "0644 0755 zip tar.gz tar.bz2 tar gz bz2" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::getabsdir
  getabsdir )
    COMPREPLY=( $(compgen -W "absdir" -- ${cur}) )
    case ${prev} in
      absdir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::getdir
  getdir )
    COMPREPLY=( $(compgen -W "dir" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::getdiractions
  getdiractions )
    COMPREPLY=( $(compgen -W "dir file" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::getdiskinfo
  getdiskinfo )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::getedittype
  getedittype )
    COMPREPLY=( $(compgen -W "dir file" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::getfileactions
  getfileactions )
    COMPREPLY=( $(compgen -W "dir file newedit" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      newedit )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::getpath
  getpath )
    COMPREPLY=( $(compgen -W "dir" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::listfiles
  listfiles )
    COMPREPLY=( $(compgen -W "checkleaf dir filelist filepath-{1..10} needmime showdotfiles types" -- ${cur}) )
    case ${prev} in
      checkleaf )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      filelist )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      filepath-* )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      needmime )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      showdotfiles )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      types )
        COMPREPLY=( $(compgen -W "dir file" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::mkdir
  mkdir )
    COMPREPLY=( $(compgen -W "path name permissions" -- ${cur}) )
    case ${prev} in
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      permissions )
        COMPREPLY=( $(compgen -W "0700 0750 0755" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::mkfile
  mkfile )
    COMPREPLY=( $(compgen -W "name path permissions" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      permissions )
        COMPREPLY=( $(compgen -W "0600 0640 0644" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::savefile
  savefile )
    COMPREPLY=( $(compgen -W "path filename content charset" -- ${cur}) )
    case ${prev} in
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      filename )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      content )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      charset )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::search
  search )
    COMPREPLY=( $(compgen -W "dir attributes recursive mimeinfo regex" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      attributes )
        COMPREPLY=( $(compgen -W "user groupusage size type mode ctime atime mtime" -- ${cur}) )
        return 0 ;;
      recursive )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      mimeinfo )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::statfiles
  statfiles )
    COMPREPLY=( $(compgen -W "dir files" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      files )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::uploadfiles
  uploadfiles )
    COMPREPLY=( $(compgen -W "dir file-{1..10}" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      file-* )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Fileman::viewfile
  viewfile )
    COMPREPLY=( $(compgen -W "dir files" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      files )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

ForcePassword )
  COMPREPLY=( $(compgen -W "get_force_password_flags update_force_password_flags" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ForcePassword::get_force_password_flags
  get_force_password_flags )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ForcePassword::update_force_password_flags
  update_force_password_flags )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Frontpage )
  COMPREPLY=( $(compgen -W "fpenabled list" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Frontpage::fpenabled
  fpenabled )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Frontpage::list
  list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

FSTest )
  COMPREPLY=( $(compgen -W "dirisempty" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+FSTest::dirisempty
  dirisempty )
    COMPREPLY=( $(compgen -W "dir files_only regex_ext" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      files_only )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      regex_ext )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Ftp )
  COMPREPLY=( $(compgen -W "addftp delftp listftp listftpsessions listftpwithdisk passwd setquota" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Ftp::addftp
  addftp )
    COMPREPLY=( $(compgen -W "user pass domain quota homedir" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Ftp::delftp
  delftp )
    COMPREPLY=( $(compgen -W "user domain destroy" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_ftpuser)" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      destroy )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Ftp::listftp
  listftp )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Ftp::listftpsessions
  listftpsessions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Ftp::listftpwithdisk
  listftpwithdisk )
    COMPREPLY=( $(compgen -W "dirhtml include_acct_types skip_acct_types" -- ${cur}) )
    case ${prev} in
      dirhtml )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      include_acct_types )
        COMPREPLY=( $(compgen -W "main sub logaccess" -- ${cur}) )
        return 0 ;;
      skip_acct_types )
        COMPREPLY=( $(compgen -W "main sub logaccess" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Ftp::passwd
  passwd )
    COMPREPLY=( $(compgen -W "user pass" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_ftpuser)" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Ftp::setquota
  setquota )
    COMPREPLY=( $(compgen -W "user quota" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_ftpuser)" -- ${cur}) )
        return 0 ;;
      quota )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Gpg )
  COMPREPLY=( $(compgen -W "listgpgkeys listsecretgpgkeys number_of_private_keys number_of_public_keys" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Gpg::listgpgkeys
  listgpgkeys )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Gpg::listsecretgpgkeys
  listsecretgpgkeys )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Gpg::number_of_private_keys
  number_of_private_keys )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Gpg::number_of_public_keys
  number_of_public_keys )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Htaccess )
  COMPREPLY=( $(compgen -W "listuser listusers" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Htaccess::listuser
  listuser )
    COMPREPLY=( $(compgen -W "dir" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Htaccess::listusers
  listusers )
    COMPREPLY=( $(compgen -W "dir" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

HttpUtils )
  COMPREPLY=( $(compgen -W "getdirindices" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+HttpUtils::getdirindices
  getdirindices )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

ImageManager )
  COMPREPLY=( $(compgen -W "thumbnail" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ImageManager::thumbnail
  thumbnail )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

LangMods )
  COMPREPLY=( $(compgen -W "getarchname getkey getprefix install langlist list_available list_installed magic_status pre_run search setup uninstall update" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::getarchname
  getarchname )
    COMPREPLY=( $(compgen -W "lang" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::getkey
  getkey )
    COMPREPLY=( $(compgen -W "lang key" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
      key )
        COMPREPLY=( $(compgen -W "name names" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::getprefix
  getprefix )
    COMPREPLY=( $(compgen -W "lang" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::install
  install )
    COMPREPLY=( $(compgen -W "lang mod quiet" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
      mod )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      quiet )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::langlist
  langlist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::list_available
  list_available )
    COMPREPLY=( $(compgen -W "lang skip want" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
      skip )
        COMPREPLY=( $(compgen -W "{10..100..10}" -- ${cur}) )
        return 0 ;;
      want )
        COMPREPLY=( $(compgen -W "{10..100..10}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::list_installed
  list_installed )
    COMPREPLY=( $(compgen -W "lang sys" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
      sys )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::magic_status
  magic_status )
    COMPREPLY=( $(compgen -W "lang" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::pre_run
  pre_run )
    COMPREPLY=( $(compgen -W "lang" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::search
  search )
    COMPREPLY=( $(compgen -W "lang skip want regex" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
      skip )
        COMPREPLY=( $(compgen -W "{10..100..10}" -- ${cur}) )
        return 0 ;;
      want )
        COMPREPLY=( $(compgen -W "{10..100..10}" -- ${cur}) )
        return 0 ;;
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::setup
  setup )
    COMPREPLY=( $(compgen -W "lang" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::uninstall
  uninstall )
    COMPREPLY=( $(compgen -W "lang mod quiet" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
      mod )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      quiet )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LangMods::update
  update )
    COMPREPLY=( $(compgen -W "lang mod quiet" -- ${cur}) )
    case ${prev} in
      lang )
        COMPREPLY=( $(compgen -W "$(_cpapi_langlist)" -- ${cur}) )
        return 0 ;;
      mod )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      quiet )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

LeechProtect )
  COMPREPLY=( $(compgen -W "setup" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LeechProtect::setup
  setup )
    COMPREPLY=( $(compgen -W "dir item type" -- ${cur}) )
    case ${prev} in
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      item )
        COMPREPLY=( $(compgen -W "email kill numhits url" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "html uri check" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Locale )
  COMPREPLY=( $(compgen -W "get_encoding get_html_dir_attr get_locale_name get_user_locale get_user_locale_name numf" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Locale::get_encoding
  get_encoding )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Locale::get_html_dir_attr
  get_html_dir_attr )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Locale::get_locale_name
  get_locale_name )
    COMPREPLY=( $(compgen -W "locale" -- ${cur}) )
    case ${prev} in
      locale )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Locale::get_user_locale
  get_user_locale )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Locale::get_user_locale_name
  get_user_locale_name )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Locale::numf
  numf )
    COMPREPLY=( $(compgen -W "number max_decimal_places" -- ${cur}) )
    case ${prev} in
      number )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      max_decimal_places )
        COMPREPLY=( $(compgen -W "{0..10}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Logaholic )
  COMPREPLY=( $(compgen -W "adduser adduserprofile deleteuser deleteuserprofile edituser fetchuser listuserprofiles logaholiclink processstats" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::adduser
  adduser )
    COMPREPLY=( $(compgen -W "username password" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::adduserprofile
  adduserprofile )
    COMPREPLY=( $(compgen -W "username profile" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      profile )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::deleteuser
  deleteuser )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::deleteuserprofile
  deleteuserprofile )
    COMPREPLY=( $(compgen -W "username profile" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      profile )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::edituser
  edituser )
    COMPREPLY=( $(compgen -W "username fullname email password" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      fullname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "$(_cpapi_emailAddress)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::fetchuser
  fetchuser )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::listuserprofiles
  listuserprofiles )
    COMPREPLY=( $(compgen -W "username" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::logaholiclink
  logaholiclink )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

#  https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Logaholic::processstats
  processstats )
    COMPREPLY=( $(compgen -W "username profile" -- ${cur}) )
    case ${prev} in
      username )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      profile )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

LVEInfo )
  COMPREPLY=( $(compgen -W "getUsage" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+LVEInfo::getUsage
  getUsage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Mime )
  COMPREPLY=( $(compgen -W "listhandlers list_hotlinks listmime listredirects redirectname redirecturlname" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Mime::listhandlers
  listhandlers )
    COMPREPLY=( $(compgen -W "system user" -- ${cur}) )
    case ${prev} in
      system )
        COMPREPLY=( $(compgen -W "yes no" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "yes no" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Mime::list_hotlinks
  list_hotlinks )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Mime::listmime
  listmime )
    COMPREPLY=( $(compgen -W "system user" -- ${cur}) )
    case ${prev} in
      system )
        COMPREPLY=( $(compgen -W "yes no" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "yes no" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Mime::listredirects
  listredirects )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Mime::redirectname
  redirectname )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Mime::redirecturlname
  redirecturlname )
    COMPREPLY=( $(compgen -W "url" -- ${cur}) )
    case ${prev} in
      url )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

MysqlFE )
  COMPREPLY=( $(compgen -W "authorizehost changedbuserpassword createdb createdbuser dbuserexists deauthorizehost deletedb deletedbuser getalldbsinfo getalldbusersanddbs getdbuserprivileges getdbusers gethosts getmysqlprivileges getmysqlserverprivileges has_mycnf_for_cpuser listdbs listdbsbackup listhosts listusers listusersindb revokedbuserprivileges setdbuserprivileges userdbprivs" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::authorizehost
  authorizehost )
    COMPREPLY=( $(compgen -W "host" -- ${cur}) )
    case ${prev} in
      host )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::changedbuserpassword
  changedbuserpassword )
    COMPREPLY=( $(compgen -W "db_user password" -- ${cur}) )
    case ${prev} in
      db_user )
        COMPREPLY=( $(compgen -W "$(_cpapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::createdb
  createdb )
    COMPREPLY=( $(compgen -W "db" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::createdbuser
  createdbuser )
    COMPREPLY=( $(compgen -W "dbuser password" -- ${cur}) )
    case ${prev} in
      dbuser )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::dbuserexists
  dbuserexists )
    COMPREPLY=( $(compgen -W "dbuser" -- ${cur}) )
    case ${prev} in
      dbuser )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::deauthorizehost
  deauthorizehost )
    COMPREPLY=( $(compgen -W "host" -- ${cur}) )
    case ${prev} in
      host )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::deletedb
  deletedb )
    COMPREPLY=( $(compgen -W "db" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "$(_cpapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::deletedbuser
  deletedbuser )
    COMPREPLY=( $(compgen -W "dbuser" -- ${cur}) )
    case ${prev} in
      dbuser )
        COMPREPLY=( $(compgen -W "$(_cpapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::getalldbsinfo
  getalldbsinfo )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::getalldbusersanddbs
  getalldbusersanddbs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::getdbuserprivileges
  getdbuserprivileges )
    COMPREPLY=( $(compgen -W "dbuser db" -- ${cur}) )
    case ${prev} in
      dbuser )
        COMPREPLY=( $(compgen -W "$(_cpapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      db )
        COMPREPLY=( $(compgen -W "$(_cpapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::getdbusers
  getdbusers )
    COMPREPLY=( $(compgen -W "db" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "$(_cpapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::gethosts
  gethosts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::getmysqlprivileges
  getmysqlprivileges )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::getmysqlserverprivileges
  getmysqlserverprivileges )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::has_mycnf_for_cpuser
  has_mycnf_for_cpuser )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::listdbs
  listdbs )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::listdbsbackup
  listdbsbackup )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::listhosts
  listhosts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::listusers
  listusers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::listusersindb
  listusersindb )
    COMPREPLY=( $(compgen -W "db" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "$(_cpapi_dblist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::revokedbuserprivileges
  revokedbuserprivileges )
    COMPREPLY=( $(compgen -W "db dbuser" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "$(_cpapi_dblist)" -- ${cur}) )
        return 0 ;;
      dbuser )
        COMPREPLY=( $(compgen -W "$(_cpapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::setdbuserprivileges
  setdbuserprivileges )
    COMPREPLY=( $(compgen -W "db dbuser privileges" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "$(_cpapi_dblist)" -- ${cur}) )
        return 0 ;;
      dbuser )
        COMPREPLY=( $(compgen -W "$(_cpapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
      privileges )
        COMPREPLY=( $(compgen -W "ALL%20PRIVILEGES ALTER ALTER%20ROUTINE CREATE CREATE%20ROUTINE CREATE%20TEMPORARY%20TABLES CREATE%20VIEW DELETE DROP EVENT EXECUTE INDEX INSERT LOCK%20TABLES REFERENCES SELECT SHOW%20VIEW TRIGGER UPDATE" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+MysqlFE::userdbprivs
  userdbprivs )
    COMPREPLY=( $(compgen -W "db dbuser" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "$(_cpapi_dblist)" -- ${cur}) )
        return 0 ;;
      dbuser )
        COMPREPLY=( $(compgen -W "$(_cpapi_dbuserlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

MysqlOptimizer )
  COMPREPLY=( $(compgen -W "fetch_slow_queries" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/displaaay/DD/cPanel+API+2+Functions+-+MysqlOptimizer::fetch_slow_queries
  fetch_slow_queries )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Net )
  COMPREPLY=( $(compgen -W "dnszone traceroute" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Net::dnszone
  dnszone )
    COMPREPLY=( $(compgen -W "host" -- ${cur}) )
    case ${prev} in
      host )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Net::traceroute
  traceroute )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

News )
  COMPREPLY=( $(compgen -W "does_news_exist does_news_type_exist get_news" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+News::does_news_exist
  does_news_exist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+News::does_news_type_exist
  does_news_type_exist )
    COMPREPLY=( $(compgen -W "type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "gtlobal cpanel resold" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+News::get_news
  get_news )
    COMPREPLY=( $(compgen -W "type" -- ${cur}) )
    case ${prev} in
      type )
        COMPREPLY=( $(compgen -W "global cpanel resold" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

NVData )
  COMPREPLY=( $(compgen -W "get set setall" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+NVData::get
  get )
    COMPREPLY=( $(compgen -W "names" -- ${cur}) )
    case ${prev} in
      names )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+NVData::set
  set )
    COMPREPLY=( $(compgen -W "names" -- ${cur}) )
    case ${prev} in
      names )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+NVData::setall
  setall )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Park )
  COMPREPLY=( $(compgen -W "listaddondomains listparkeddomains park unpark" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Park::listaddondomains
  listaddondomains )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Park::listparkeddomains
  listparkeddomains )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Park::park
  park )
    COMPREPLY=( $(compgen -W "domain topdomain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      topdomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Park::unpark
  unpark )
    COMPREPLY=( $(compgen -W "domain subdomain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      subdomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Passwd )
  COMPREPLY=( $(compgen -W "change_password set_digest_auth" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Passwd::change_password
  change_password )
    COMPREPLY=( $(compgen -W "user oldpass newpass enablemysql enabledigest" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
      oldpass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      newpass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      enablemysql )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      enabledigest )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Passwd::set_digest_auth
  set_digest_auth )
    COMPREPLY=( $(compgen -W "user password enabledigest" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      enabledigest )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

PasswdStrength )
  COMPREPLY=( $(compgen -W "appstrengths get_password_strength get_required_strength" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+PasswdStrength::appstrengths
  appstrengths )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+PasswdStrength::get_password_strength
  get_password_strength )
    COMPREPLY=( $(compgen -W "password" -- ${cur}) )
    case ${prev} in
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+PasswdStrength::get_required_strength
  get_required_strength )
    COMPREPLY=( $(compgen -W "app" -- ${cur}) )
    case ${prev} in
      app )
        COMPREPLY=( $(compgen -W "htaccess passwd ftp createacct bandmin cpaddons pop sshkey postgres webdisk mysql" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

PHPINI )
  COMPREPLY=( $(compgen -W "getalloptions getoptions" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+PHPINI::getalloptions
  getalloptions )
    COMPREPLY=( $(compgen -W "php_prefix" -- ${cur}) )
    case ${prev} in
      php_prefix )
        COMPREPLY=( $(compgen -W "/usr/local/ /usr/local/php4/ /usr/local/cpanel/3rdparty/" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+PHPINI::getoptions
  getoptions )
    COMPREPLY=( $(compgen -W "dirlist getnull php_prefix" -- ${cur}) )
    case ${prev} in
      dirlist )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      getnull )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      php_prefix )
        COMPREPLY=( $(compgen -W "/usr/local/ /usr/local/php4/ /usr/local/cpanel/3rdparty/" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Postgres )
  COMPREPLY=( $(compgen -W "listdbs listusers listusersindb userexists" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Postgres::listdbs
  listdbs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Postgres::listusers
  listusers )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Postgres::listusersindb
  listusersindb )
    COMPREPLY=( $(compgen -W "db" -- ${cur}) )
    case ${prev} in
      db )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Postgres::userexists
  userexists )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Rand )
  COMPREPLY=( $(compgen -W "getranddata" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Rand::getranddata
  getranddata )
    COMPREPLY=( $(compgen -W "length" -- ${cur}) )
    case ${prev} in
      length )
        COMPREPLY=( $(compgen -W "{10..100..10}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Resellers )
  COMPREPLY=( $(compgen -W "get_sub_accounts" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Resellers::get_sub_accounts
  get_sub_accounts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

RoR )
  COMPREPLY=( $(compgen -W "addapp changeapp importrails listapps listrewrites needsimport removeapp removerewrite restartapp setuprewrite softrestartapp startapp stopapp" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::addapp
  addapp )
    COMPREPLY=( $(compgen -W "appname env path loadonboot" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      env )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      path )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      loadonboot )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::changeapp
  changeapp )
    COMPREPLY=( $(compgen -W "appname env newappname newloadonboot" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      env )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      newappname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      newloadonboot )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::importrails
  importrails )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::listapps
  listapps )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::listrewrites
  listrewrites )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::needsimport
  needsimport )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::removeapp
  removeapp )
    COMPREPLY=( $(compgen -W "appname" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::removerewrite
  removerewrite )
    COMPREPLY=( $(compgen -W "appname rewritedomain rewriteurl" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      rewritedomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      rewriteurl )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::restartapp
  restartapp )
    COMPREPLY=( $(compgen -W "appname" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::setuprewrite
  setuprewrite )
    COMPREPLY=( $(compgen -W "appname rewritedomain rewriteurl" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      rewritedomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      rewriteurl )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::softrestartapp
  softrestartapp )
    COMPREPLY=( $(compgen -W "appname" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::startapp
  startapp )
    COMPREPLY=( $(compgen -W "appname" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+RoR::stopapp
  stopapp )
    COMPREPLY=( $(compgen -W "appname" -- ${cur}) )
    case ${prev} in
      appname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SetLang )
  COMPREPLY=( $(compgen -W "setlocale" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SetLang::setlocale
  setlocale )
    COMPREPLY=( $(compgen -W "locale" -- ${cur}) )
    case ${prev} in
      locale )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SourceIPCheck )
  COMPREPLY=( $(compgen -W "addip delip getaccount listips loadsecquestions resetsecquestions samplequestions savesecquestions" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::addip
  addip )
    COMPREPLY=( $(compgen -W "ip" -- ${cur}) )
    case ${prev} in
      ip )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::delip
  delip )
    COMPREPLY=( $(compgen -W "ip" -- ${cur}) )
    case ${prev} in
      ip )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::getaccount
  getaccount )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::listips
  listips )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::loadsecquestions
  loadsecquestions )
    COMPREPLY=( $(compgen -W "account q{1..10} q{1..10}answer" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
      q* )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      q*answer )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::resetsecquestions
  resetsecquestions )
    COMPREPLY=( $(compgen -W "account" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::samplequestions
  samplequestions )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SourceIPCheck::savesecquestions
  savesecquestions )
    COMPREPLY=( $(compgen -W "account q{1..10}answer q{1..10}ques" -- ${cur}) )
    case ${prev} in
      account )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
      q*answer )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      q*ques )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SPFUI )
  COMPREPLY=( $(compgen -W "available count_settings entries_complete getmainserverip get_raw_record install installed list_settings load_current_values uninstall" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::available
  available )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::count_settings
  count_settings )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::entries_complete
  entries_complete )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::getmainserverip
  getmainserverip )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::get_raw_record
  get_raw_record )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::install
  install )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::installed
  installed )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::list_settings
  list_settings )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::load_current_values
  load_current_values )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SPFUI::uninstall
  uninstall )
    COMPREPLY=( $(compgen -W "user" -- ${cur}) )
    case ${prev} in
      user )
        COMPREPLY=( $(compgen -W "$(_cpapi_cpuser)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SSH )
  COMPREPLY=( $(compgen -W "authkey converttoppk delkey fetchkey genkey genkey_legacy importkey listkeys" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::authkey
  authkey )
    COMPREPLY=( $(compgen -W "key action" -- ${cur}) )
    case ${prev} in
      key )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      action )
        COMPREPLY=( $(compgen -W "authorize deauthorize" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::converttoppk
  converttoppk )
    COMPREPLY=( $(compgen -W "name pass keep_file" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      keep_file )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::delkey
  delkey )
    COMPREPLY=( $(compgen -W "name pub" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pub )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::fetchkey
  fetchkey )
    COMPREPLY=( $(compgen -W "name pub" -- ${cur}) )
    case ${prev} in
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pub )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::genkey
  genkey )
    COMPREPLY=( $(compgen -W "bits name pass type" -- ${cur}) )
    case ${prev} in
      bits )
        COMPREPLY=( $(compgen -W "{1024..4096..512}" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "dsa rsa" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::genkey_legacy
  genkey_legacy )
    COMPREPLY=( $(compgen -W "bits name pass type" -- ${cur}) )
    case ${prev} in
      bits )
        COMPREPLY=( $(compgen -W "{1024..4096..512}" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "dsa rsa" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::importkey
  importkey )
    COMPREPLY=( $(compgen -W "key name pass" -- ${cur}) )
    case ${prev} in
      key )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pass )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSH::listkeys
  listkeys )
    COMPREPLY=( $(compgen -W "keys pub types" -- ${cur}) )
    case ${prev} in
      keys )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      pub )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      types )
        COMPREPLY=( $(compgen -W "rsa dsa" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SSL )
  COMPREPLY=( $(compgen -W "fetchcabundle fetchinfo gencrt gencsr genkey getcnname installssl listcrts listcsrs listkeys listsslitems uploadcrt uploadkey" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::fetchcabundle
  fetchcabundle )
    COMPREPLY=( $(compgen -W "crt" -- ${cur}) )
    case ${prev} in
      crt )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::fetchinfo
  fetchinfo )
    COMPREPLY=( $(compgen -W "crtdata domain" -- ${cur}) )
    case ${prev} in
      crtdata )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::gencrt
  gencrt )
    COMPREPLY=( $(compgen -W "city company companydivision country email host state" -- ${cur}) )
    case ${prev} in
      city )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      company )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      companydivision )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      country )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      host )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      state )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::gencsr
  gencsr )
    COMPREPLY=( $(compgen -W "city company companydivision country email host state password" -- ${cur}) )
    case ${prev} in
      city )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      company )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      companydivision )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      country )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      email )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      host )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      state )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::genkey
  genkey )
    COMPREPLY=( $(compgen -W "host keysize" -- ${cur}) )
    case ${prev} in
      host )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      keysize )
        COMPREPLY=( $(compgen -W "{1024..4096..1024}" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::getcnname
  getcnname )
    COMPREPLY=( $(compgen -W "domain service add_mail_subdomain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      service )
        COMPREPLY=( $(compgen -W "imap pop3 smtp dav cpanel" -- ${cur}) )
        return 0 ;;
      add_mail_subdomain )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::installssl
  installssl )
    COMPREPLY=( $(compgen -W "cabundle crt domain key" -- ${cur}) )
    case ${prev} in
      cabundle )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      crt )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      key )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::listcrts
  listcrts )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::listcsrs
  listcsrs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::listkeys
  listkeys )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::listsslitems
  listsslitems )
    COMPREPLY=( $(compgen -W "domains items" -- ${cur}) )
    case ${prev} in
      domains )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      items )
        COMPREPLY=( $(compgen -W "key crt csr" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::uploadcrt
  uploadcrt )
    COMPREPLY=( $(compgen -W "crt" -- ${cur}) )
    case ${prev} in
      crt )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSL::uploadkey
  uploadkey )
    COMPREPLY=( $(compgen -W "key host" -- ${cur}) )
    case ${prev} in
      key )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      host )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SSLInfo )
  COMPREPLY=( $(compgen -W "fetchinfo" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SSLInfo::fetchinfo
  fetchinfo )
    COMPREPLY=( $(compgen -W "crtdata domain" -- ${cur}) )
    case ${prev} in
      crtdata )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

Statcache )
  COMPREPLY=( $(compgen -W "clearcache" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+StatCache::clearcache
  clearcache )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Stats )
  COMPREPLY=( $(compgen -W "getmonthlybandwidth getmonthlydomainbandwidth getthismonthsbwusage lastapachehits lastvisitors listanalog listawstats listlastvisitors listrawlogs listurchin listwebalizer" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::getmonthlybandwidth
  getmonthlybandwidth )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::getmonthlydomainbandwidth
  getmonthlydomainbandwidth )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::getthismonthsbwusage
  getthismonthsbwusage )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::lastapachehits
  lastapachehits )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::lastvisitors
  lastvisitors )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::listanalog
  listanalog )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::listawstats
  listawstats )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::listlastvisitors
  listlastvisitors )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::listrawlogs
  listrawlogs )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::listurchin
  listurchin )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Stats::listwebalizer
  listwebalizer )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

StatsBar )
  COMPREPLY=( $(compgen -W "getrowcounter rowcounter setrowcounter stat" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+StatsBar::getrowcounter
  getrowcounter )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+StatsBar::rowcounter
  rowcounter )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+StatsBar::setrowcounter
  setrowcounter )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+StatsBar::stat
  stat )
    COMPREPLY=( $(compgen -W "display warnings warninglevel warnout infinityimg infinitylang rowcounter" -- ${cur}) )
    case ${prev} in
      display )
        COMPREPLY=( $(compgen -W "ftpaccounts perlversion dedicatedip hostname operatingsystem sendmailpath autoresponders perlpath emailforwarders bandwidthusage emailfilters mailinglists diskusage phpversion sqldatabases apacheversion kernelversion shorthostname parkeddomains cpanelbuild theme addondomains cpanelrevision machinetype cpanelversion mysqldiskusage mysqlversion subdomains postgresdiskusage sharedip hostingpackage emailaccounts" -- ${cur}) )
        return 0 ;;
      warnings )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      warninglevel )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      warnout )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      infinityimg )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      infinitylang )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      rowcounter )
        COMPREPLY=( $(compgen -W "odd even" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

SubDomain )
  COMPREPLY=( $(compgen -W "addsubdomain changedocroot delsubdomain getreservedsubdomains listsubdomains validregex" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SubDomain::addsubdomain
  addsubdomain )
    COMPREPLY=( $(compgen -W "domain rootdomain canoff dir disallowdot" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      rootdomain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      canoff )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      disallowdot )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SubDomain::changedocroot
  changedocroot )
    COMPREPLY=( $(compgen -W "subdomain rootdomain dir" -- ${cur}) )
    case ${prev} in
      subdomain )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      rootdomain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      dir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SubDomain::delsubdomain
  delsubdomain )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SubDomain::getreservedsubdomains
  getreservedsubdomains )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SubDomain::listsubdomains
  listsubdomains )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+SubDomain::validregex
  validregex )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

Themes )
  COMPREPLY=( $(compgen -W "apply_new_theme does_cpanel_theme_exist get_available_themes get_themes_list restore_saved_theme" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Themes::apply_new_theme
  apply_new_theme )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Themes::does_cpanel_theme_exist
  does_cpanel_theme_exist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Themes::get_available_themes
  get_available_themes )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Themes::get_themes_list
  get_themes_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+Themes::restore_saved_theme
  restore_saved_theme )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

UI )
  COMPREPLY=( $(compgen -W "dynamicincludelist includelist listform paginate paginate_list" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+UI::dynamicincludelist
  dynamicincludelist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+UI::includelist
  includelist )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+UI::listform
  listform )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+UI::paginate
  paginate )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+UI::paginate_list
  paginate_list )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

UserHttpUtils )
  COMPREPLY=( $(compgen -W "getdirindices" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+UserHttpUtils::getdirindices
  getdirindices )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

WebDisk )
  COMPREPLY=( $(compgen -W "addwebdisk delwebdisk hasdigest listwebdisks passwdwebdisk set_digest_auth set_homedir set_perms setstatus" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::addwebdisk
  addwebdisk )
    COMPREPLY=( $(compgen -W "domain user password perms homedir private enabledigest password_hash digest_auth_hash" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      user )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      perms )
        COMPREPLY=( $(compgen -W "ro rw" -- ${cur}) )
        return 0 ;;
      homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      private )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      enabledigest )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      password_hash )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      digest_auth_hash )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::delwebdisk
  delwebdisk )
    COMPREPLY=( $(compgen -W "login" -- ${cur}) )
    case ${prev} in
      login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::hasdigest
  hasdigest )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::listwebdisks
  listwebdisks )
    COMPREPLY=( $(compgen -W "regex" -- ${cur}) )
    case ${prev} in
      regex )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::passwdwebdisk
  passwdwebdisk )
    COMPREPLY=( $(compgen -W "login password enablediget" -- ${cur}) )
    case ${prev} in
      login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      enablediget )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::set_digest_auth
  set_digest_auth )
    COMPREPLY=( $(compgen -W "login password enabledigest" -- ${cur}) )
    case ${prev} in
      login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      enabledigest )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::set_homedir
  set_homedir )
    COMPREPLY=( $(compgen -W "login homedir private" -- ${cur}) )
    case ${prev} in
      login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      homedir )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      private )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::set_perms
  set_perms )
    COMPREPLY=( $(compgen -W "login password perms" -- ${cur}) )
    case ${prev} in
      login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      password )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      perms )
        COMPREPLY=( $(compgen -W "rw ro" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebDisk::setstatus
  setstatus )
    COMPREPLY=( $(compgen -W "login on" -- ${cur}) )
    case ${prev} in
      login )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      on )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

WebmailApps )
  COMPREPLY=( $(compgen -W "listwebmailapps" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+WebmailApps::listwebmailapps
  listwebmailapps )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;
  esac

return 0 ;;

ZoneEdit )
  COMPREPLY=( $(compgen -W "add_zone_record edit_zone_record fetch_cpanel_generated_domains fetchzone fetchzone_records fetchzones get_zone_record remove_zone_record resetzone" -- ${cur}) )

  case ${functionName} in

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::add_zone_record
  add_zone_record )
    COMPREPLY=( $(compgen -W "domain name type txtdata target Weight priority cname address flag tag value ttl class flatten flatten_to" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "A CAA CNAME TXT AAAA SRV" -- ${cur}) )
        return 0 ;;
      txtdata )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      target )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      Weight )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      priority )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      cname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      address )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      flag )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      tag )
        COMPREPLY=( $(compgen -W "issue issuewild iodef" -- ${cur}) )
        return 0 ;;
      value )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      ttl )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      class )
        COMPREPLY=( $(compgen -W "IN" -- ${cur}) )
        return 0 ;;
      flatten )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      flatten_to )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::edit_zone_record
  edit_zone_record )
    COMPREPLY=( $(compgen -W "line domain name type txtdata target Weight priority cname address flag tag value ttl class preference exchange" -- ${cur}) )
    case ${prev} in
      line )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "A CAA CNAME TXT AAAA SRV" -- ${cur}) )
        return 0 ;;
      txtdata )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      target )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      Weight )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      priority )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      cname )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      address )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      flag )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      tag )
        COMPREPLY=( $(compgen -W "issue issuewild iodef" -- ${cur}) )
        return 0 ;;
      value )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      ttl )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      class )
        COMPREPLY=( $(compgen -W "IN" -- ${cur}) )
        return 0 ;;
      preference )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      exchange )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::fetch_cpanel_generated_domains
  fetch_cpanel_generated_domains )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::fetchzone
  fetchzone )
    COMPREPLY=( $(compgen -W "domain customonly line ttl name class address type txtdata preference exchange" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      customonly )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      line )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      ttl )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      class )
        COMPREPLY=( $(compgen -W "IN" -- ${cur}) )
        return 0 ;;
      address )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "A AAAA CAA CNAME MX NS RAW SOA SRV TXT" -- ${cur}) )
        return 0 ;;
      txtdata )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      preference )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      exchange )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::fetchzone_records
  fetchzone_records )
    COMPREPLY=( $(compgen -W "domain customonly line ttl name class address type txtdata preference exchange" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      customonly )
        COMPREPLY=( $(compgen -W "$(_cpapi_boolean)" -- ${cur}) )
        return 0 ;;
      line )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      ttl )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      name )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      class )
        COMPREPLY=( $(compgen -W "IN" -- ${cur}) )
        return 0 ;;
      address )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      type )
        COMPREPLY=( $(compgen -W "A AAAA CAA CNAME MX NS RAW SOA SRV TXT" -- ${cur}) )
        return 0 ;;
      txtdata )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      preference )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
      exchange )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::fetchzones
  fetchzones )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::get_zone_record
  get_zone_record )
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::remove_zone_record
  remove_zone_record )
    COMPREPLY=( $(compgen -W "domain line" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
      line )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;

# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+ZoneEdit::resetzone
  resetzone )
    COMPREPLY=( $(compgen -W "domain" -- ${cur}) )
    case ${prev} in
      domain )
        COMPREPLY=( $(compgen -W "$(_cpapi_domainlist)" -- ${cur}) )
        return 0 ;;
    esac
    return 0 ;;
  esac

return 0 ;;

  *) ;;
esac

COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
return 0;
}
complete -F _cpapi2 cpapi2;

