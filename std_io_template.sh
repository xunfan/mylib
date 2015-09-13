#!/bin/sh

die () {
        echo "$@" 1>&2
        exit 1
}

if [ "$#" -ne 1 ]
then
  echo "usage: $0 <>"
  exit 1
fi

# list and for loop blob
list=( a b
         c )

for x in ${list[*]}
do
  echo $x
done

#timestr=$(date +"%Y%m%d")
#echo $timestr

ARGV1=$1

