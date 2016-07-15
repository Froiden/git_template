# Git Hooks
This repository is git template for used at Froiden. It contains some hooks to enforce commit message policy and other rules.

## Configuration

1. Run following command:

	    git clone https://github.com/Froiden/git_template.git ~/.git_template

2. Run following command:

	    git config --global init.templatedir '~/.git_template'

This has configured `.git_template` directory in your home folder as git template directory. 
Now you need to run following command in each of your repositories once:

	git init

If you create new repository, the hooks will automatically be copied. If you clone, you need to run the above command once.
