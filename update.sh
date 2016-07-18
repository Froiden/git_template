#!/bin/bash
echo "Finding the hooks present in $1";
if ! [ -d "$1" ]; then
  echo "Could not find any direcotry $1";
  exit -1;
fi

if ! [ -d "${HOME}/.git_template/hooks" ]; then
  echo "Could not find the source hooks file to be copied.";
  echo "Please create hooks in ${HOME}/.git_template/hooks";
  exit -1;
fi

for ch_dir in `ls -D $1`
do
  echo "Handling the directory ${ch_dir}";
  if ! [ -d "$1/${ch_dir}/.git" ]; then
    echo "${ch_dir} is not a git project. Skipping it...";
    continue;
  fi
  echo "Copying the files form ${HOME}/.git_templates/hooks/* into $1/${ch_dir}/.git/hooks/*";
  `cp ${HOME}/.git_template/hooks/* $1/${ch_dir}/.git/hooks/`;
done

echo "Completed the execution.";
echo "Bye.....";
echo "";
echo "";


