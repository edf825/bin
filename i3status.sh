#!/bin/bash

i3status | while read line
do
  if [ -e ~/.westpac-balance ] && [[ $line =~ full_text ]]; then
    balance=`cat ~/.westpac-balance`
    line=`echo $line | sed "s/{/{\"full_text\":\"$balance\"},{/"`
  fi
  echo $line
done
