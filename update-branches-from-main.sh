#!/bin/bash

local_branches=$(git branch | sed 's/\*//' | grep -v 'main' | grep -v 'custom-go-php')

git pull --all
git checkout main
git pull origin main

for branch in $local_branches; do
  echo $branch
  git checkout $branch
  git merge main
  rm update-branches-from-main.sh
  git add .
  git commit -m 'chore: main sync'
  git push origin $branch
done
