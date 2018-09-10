    case ${prev} in
       )
        COMPREPLY=( $(compgen -W "" -- ${cur}) )
        return 0 ;;
    esac
