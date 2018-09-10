
  *) ;;
esac

COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
return 0;
}
complete -F _whmapi1 whmapi1;

