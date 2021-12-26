!/usr/bin/env bash

states=("Kansas","Nevada", "Pennslyvania", "Washington", "Oregon")

for i in ${states[@]};
do
  if [ $i=="Kansas" ]
  then
      echo "Kansas is the best!"
      break
  else
      echo "I'm not fond of Nevada" 
  fi
done
