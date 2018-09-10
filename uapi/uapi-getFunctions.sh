#!/bin/bash

#w3m -dump -cols 500 https://documentation.cpanel.net/display/DD/Guide+to+UAPI | grep ':: ' | sed 's/:: /::/g' > uapi.txt

for section in $(awk -F: '{print $1}' uapi.txt | sort | uniq); do
  dirname="docs/$section/"
  mkdir -p $dirname;
  for functionName in $(awk -F: "/$section/"'{print $NF}' uapi.txt); do
    filename="$dirname/$functionName";
    echo "# https://documentation.cpanel.net/display/DD/UAPI+Functions+-+${section}::${functionName}" > $filename;
    echo >> $filename;
  done
done

#echo "
#  # https://documentation.cpanel.net/display/DD/UAPI+Functions+-+${url}
#  $functionName )"'
#    COMPREPLY=( $(compgen -W "" -- ${cur}) )
#    return 0 ;;'

