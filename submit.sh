#! /bin/bash

git add .
time=`date`
echo $time
git commit -m "$time"
git push songlei master
