#!/bin/sh

filesdir=$1
searchstr=$2

if [ -z $filesdir ] || [ -z $searchstr ]; then
  echo "At least one argument is empty"
  return 1
fi

if [ ! -d $filesdir ]; then
  echo "${filesdir} doesn't represent a directory"
  return 1
fi

nr_files=0
nr_matched_lines=0
for file in $(find $filesdir -type f); do
  nr_files=$((nr_files+1))
  if [ ! -z "$(grep $searchstr $file)" ]; then
    nr_matched_lines=$((nr_matched_lines+1))
  fi
done

echo "The number of files are ${nr_files} and the number of matching lines are ${nr_matched_lines}"

return 0