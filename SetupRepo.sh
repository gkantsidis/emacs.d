#!/bin/bash

remotes=`git remote`
if [[ $remotes == *"purcell"* ]]; then
  echo "remotes setup correctly"
else
  git remote add --tags purcell https://github.com/purcell/emacs.d
  git fetch purcell
fi
