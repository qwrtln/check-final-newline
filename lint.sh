#!/bin/sh -l

MODIFIED=0
SHOULD_COMMIT=$1 # Accept the commit_changes argument

git config --global --add safe.directory /github/workspace

# Check each file and append a newline if missing
for f in $(git grep -Il ''); do
  if [ "$(tail -c 1 "$f")" ]; then
    echo "$f"
    echo "" >> "$f" # Append newline
    MODIFIED=1
  fi
done

# If any file was modified and SHOULD_COMMIT is true, commit the changes
if [ $MODIFIED -eq 1 ] && [ "$SHOULD_COMMIT" = "true" ]; then
  git config --global user.email "noreply@studyu.health"
  git config --global user.name "StudyU Linter"
  git add .
  git commit -m "chore: Append newline to end of file"
  CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
  git push origin "$CURRENT_BRANCH"
fi
