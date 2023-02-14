#!/bin/bash 
cat users.txt | grep @ > tmp
cat tmp | tr '.' ' ' | sed -e 's/[^0-9]/ /g' -e 's/^ *//g' -e 's/ *$//g' | tr -s ' ' | sed 's/ /./g' > ids.txt
#awk -F' ' '{ print $2 }' tmp-mail.txt > tmp
while read -r a b c; do
  if [[ "$b" == *".com"* && ! -z "$c" && $((c%2))  -eq 1 ]]; then
    echo "The ID $c of the Email $b is ODD.."	  
  elif [[ "$b" == *".com"* && ! -z "$c" && $((c%2))  -eq 0 ]]; then
    echo "The ID $c of the Email $b is Even.."
  fi
done < tmp
rm -rf tmp ids.txt
