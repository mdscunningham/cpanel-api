#!/bin/bash

#case ${firstWord}
#  $section )
#    COMPREPLY=( $(compgen -W "$functions" -- ${cur}) )
#      case ${secondWord}
#        $param )
#          COMPREPLY=( $(compgen -W "$values" -- ${cur}) )
#          return 0 ;;
#        $param )
#          COMPREPLY=( $(compgen -W "\$($values" -- ${cur}) )
#          return 0 ;;
#      esac
#    return 0 ;;
#esac


for dir in docs/*/; do basename $dir | sed 's|/$||g'; done | tr '\n' ' ' | sed 's/ $//'

for dir in docs/*/; do
  sectionName=$(basename $dir | sed 's|/$||g')
  functionList=$(for x in $dir/*; do basename $x; done | tr '\n' ' ' | sed 's/ $//')

  echo "
$sectionName )
  COMPREPLY=( \$(compgen -W \"$functionList\" -- \${cur}) )

  case \${functionName} in"

for functionName in $functionList; do
  filename="$dir/$functionName"
  parameters=$(sed '/^$/d' $filename | cut -d: -f1 | sed 's/|/ /g' | grep -v '#' | tr '\n' ' ' | sed 's/ $//')

  echo "
$(head -n1 $filename)
  $functionName )
    COMPREPLY=( \$(compgen -W \"$parameters\" -- \${cur}) )"

  if [[ $parameters ]]; then
    echo -e "    case \${prev} in"

    sed '/^$/d' $filename | grep -v '#' | while read line; do
      param=$(echo $line | cut -d: -f1)
      values=$(echo $line | cut -d: -f2 | sed 's/^ //')

      if [[ $values =~ ^_ ]]; then

          echo "      $param )
        COMPREPLY=( \$(compgen -W \"\$(_cpapi${values})\" -- \${cur}) )
        return 0 ;;"

      else

          echo "      $param )
        COMPREPLY=( \$(compgen -W \"${values}\" -- \${cur}) )
        return 0 ;;"

      fi

    done
    echo "    esac"

  fi

echo "    return 0 ;;"

done

echo "  esac

return 0 ;;"

done
