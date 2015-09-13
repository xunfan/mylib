#!/bin/sh

die () {
        echo "$@" 1>&2
        exit 1
}

CDATE=$(date +%Y%m%d)

if [ "$#" -ne 1 ]
then
  echo "usage: $0 <>"
  exit 1
fi

PDF=$1

pdftoppm $PDF | pnmtopng > ${PDF%.pdf}.png
