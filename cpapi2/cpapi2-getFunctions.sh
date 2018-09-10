#!/bin/bash

if [[ ! -f cpapi2.txt ]]; then
  w3m -dump -cols 500 https://documentation.cpanel.net/display/DD/Guide+to+cPanel+API+2 | grep ':: ' | sed 's/:: /::/g' > cpapi2.txt
fi


for section in $(awk -F: '{print $1}' cpapi2.txt | sort | uniq); do
  dirname="docs/$section/"
  mkdir -p $dirname;
  for functionName in $(awk -F: "/$section/"'{print $NF}' cpapi2.txt); do
    filename="$dirname/$functionName";
    echo "# https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+${section}::${functionName}" > $filename;
    echo >> $filename;
  done
done

#echo "
#  # https://documentation.cpanel.net/display/DD/cPanel+API+2+Functions+-+${url}
#  $functionName )"'
#    COMPREPLY=( $(compgen -W "" -- ${cur}) )
#    return 0 ;;'
