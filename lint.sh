#!/bin/sh -l

ERRORS=0
for f in $(git ls-files)
do
  if [[ $(tail -c 1 $f) ]]; then
    echo $f
    ERRORS=1
  fi
done

if [ $ERRORS -eq 1 ]; then
  echo "Files above have no newline at the end."
  exit 1
fi
