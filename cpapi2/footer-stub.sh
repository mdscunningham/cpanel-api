
  *) ;;
esac

COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
return 0;
}
complete -F _cpapi2 cpapi2;

