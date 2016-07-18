#!/bin/bash
git -C ~/.git_template pull origin master
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

for ch_dir in `find $1 -type d \( ! -path "*/node_modules/*" ! -path "*/vendor/*" ! -path "*/.git/*" ! -path "*/bower_components/*" \)`
do
  #echo "Handling the directory ${ch_dir}";
  if ! [ -d "$1/${ch_dir}/.git" ]; then
    #echo "${ch_dir} is not a git project. Skipping it...";
    continue;
  fi
  `cp ${HOME}/.git_template/hooks/* $1/${ch_dir}/.git/hooks/`;
  echo "Copying hooks to ${ch_dir}/.git/hooks/";
done

echo "Completed the execution.";
echo "Bye!!";
