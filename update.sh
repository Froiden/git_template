#!/bin/bash
echo "Finding the hooks present in $1, this might take a few mins..";
if ! [ -d "$1" ]; then
  echo "Could not find any direcotry $1";
  exit -1;
fi

if ! [ -d "${HOME}/.git_template/hooks" ]; then
  echo "Could not find the source hooks file to be copied.";
  echo "Please create hooks in ${HOME}/.git_template/hooks";
  exit -1;
fi

find /Volumes/Data/htdocs -type d -not \( -path "*/node_modules/*" -prune \)  -not \( -path "*/vendor/*" -prune \)  -not \( -path "*/.git/*" -prune \)  -not \( -path "*/bower_components/*" -prune \) | while read ch_dir
do
  # echo "Handling the directory ${ch_dir}";
  if ! [ -d "${ch_dir}/.git" ]; then
    #echo "${ch_dir} is not a git project. Skipping it...";
    continue;
  fi
  `cp ${HOME}/.git_template/hooks/* ${ch_dir}/.git/hooks/`;
  echo "Copied hooks to ${ch_dir}/.git/hooks/";
done

echo "Completed the execution.";
echo "Bye!!";
