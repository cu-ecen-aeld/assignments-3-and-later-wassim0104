#!/bin/bash

if [ $# -ne 2 ]; then
  echo "Error: two args are required - filesdir & searchstr"
  exit 1
fi

filesdir=$1
searchstr=$2

#Checks if the filesdir is a directory
if [ ! -d "$filesdir" ]; then
  echo "$filesdir is not a diractory"
  exit 1
fi

filecnt=$(find $filesdir -type f 2> /dev/null | wc -l)
matchesCnt=$(find $filesdir -type f | xargs grep -c "linux" | wc -l)

echo "The number of files are $filecnt and the number of matching lines are $matchesCnt"
