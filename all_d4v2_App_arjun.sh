#!/bin/bash
ulimit -v 31457280
ulimit -a

result="D4v2_App_arjun.txt"

:> $result

solve() {
  line=`cat runtime.txt`
  res=$1
  if [ -z "$line" ]
  then
    res=$res" -1"
    fail=$[fail+1]
  else
    res=$res" "$line
  fi

  echo $res >> $result
  tot=$[tot+1]
}

path="../data/application_poly/"
files=`ls $path`

for file_name in $files
do
  echo $file_name
  timeout -k 10s 3600s ./testtime_app_cnf_arjun $path$file_name ./d4v2 -i > /dev/null
  solve $file_name
  sleep 1s
done

