#!/bin/sh -l

ERRORS=0

git config --global --add safe.directory /github/workspace

for f in $(git grep -Il '')
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
