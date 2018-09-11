
  *) ;;
esac

COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
return 0;
}

#If root user then allow tab complete of whmapi1
if [[ $UID == 0 ]]; then
  complete -F _whmapi1 whmapi1;
fi
