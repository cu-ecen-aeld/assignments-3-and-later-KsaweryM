#!/bin/sh

writefile=$1
writestr=$2

if [ -z $writefile ] || [ -z $writestr ]; then
  echo "At least one argument is empty"
  return 1
fi


status="$(rm -f $writefile && mkdir -p "$(dirname $writefile)" 2>/dev/null && echo $writestr > $writefile && echo "success" || echo "fail")"
if [ $status = "fail" ]; then
  echo "The file could not be created"
fi

return 0