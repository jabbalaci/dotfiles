#!/usr/bin/bash

for i in Star*; do
   echo $i
   cd $i
   #extRar
   qAdd
   cd ..
done

date
