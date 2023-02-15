#!/bin/bash 
#Create a new file with the Need data
cat users.txt | grep @ > tmp
#this a pattren for segement the file line by line ad get the ID only
cat tmp | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g' > ids.txt
#awk -F' ' '{ print $2 }' tmp-mail.txt > tmp
#this a looping on the generated file and segement the file for 3 pieces Name , Email And the ID 
while read -r a b c; do
	## IF the user hava a valied Domain account and the ID Number is ODD. so print the OutPut
  if [[ "$b" == *".com"* && ! -z "$c" && $((c%2))  -eq 1 ]]; then
    echo "The ID $c of the Email $b is ODD.."	  
        ## IF the user hava a valied Domain account and the ID Number is ODD. so print the OutPut
  elif [[ "$b" == *".com"* && ! -z "$c" && $((c%2))  -eq 0 ]]; then
    echo "The ID $c of the Email $b is Even.."
  fi
done < tmp
#clean up the working dir
rm -rf tmp ids.txt
