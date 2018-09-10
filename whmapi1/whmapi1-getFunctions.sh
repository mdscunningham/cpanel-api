#!/bin/bash

urlList=$( curl -s 'https://documentation.cpanel.net/display/DD/Guide+to+WHM+API+1'\
 | sed 's/<a/\n<a/g' | grep '/display/DD/.*Functions' \
 | awk -F\" '!/Reverse.DNS/ {print $2}' | sort )


for url in $urlList; do
  functionName=$(echo $url | awk -F\+ '{print $NF}' )
  echo -n "$functionName ";
done; echo


for url in $urlList; do
  functionName=$(echo $url | awk -F\+ '{print $NF}' )

  ## vars=$(curl -s https://documentation.cpanel.net${url} | grep 'WHMAPI1Functions-.*-Parameters' | sed 's/></\n/g' | awk '/h2.*Parameters/,/h2.*Returns/ {print}' | awk -F'[<>]' '/code/ {print $2}')

echo "
  # https://documentation.cpanel.net${url}
  $functionName )"'
    COMPREPLY=( $(compgen -W "" -- ${cur}) )
    return 0 ;;'

done
