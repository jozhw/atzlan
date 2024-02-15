#!/usr/bin/env bash
# pull from remote for select projects given the relative path from projects
# follow the structure {name-project}/name for the current working project
# the directories array is the list of repositories of interest for pulling

# example: the root directory is projects which houses the subdirectories
# below
declare -a directories=(
[0]="stdirgen-project/stdirgen"
)

for directory in "${directories[@]}"
do
  find "./$directory" -type d -depth 0 -exec git --git-dir={}/.git --work-tree=$PWD/{} pull origin main \;

done
