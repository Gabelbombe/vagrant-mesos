#!/bin/bash


if ! hash brew 2>/dev/null ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

for prerequisite in aws wget; do
  hash $prerequisite &> /dev/null
  if [[ $? == 1 ]]; then
    echo "In order to use this script, the executable \"$prerequisite\" must be installed." 1>&2; exit 70
  fi
done
}

vagrant-omnibus $ vagrant plugin install vagrant-omnibus
vagrant-berkshelf (>=4.0.0) $ vagrant plugin install vagrant-berkshelf
To use vagrant-berkself, you will have to install ChefDK.
vagrant-hosts $ vagrant plugin install vagrant-hosts
vagrant-cachier(optional) $ vagrant plugin install vagrant-cachier
vagrant-aws (only if you use ec2.) $ vagrant plugin install vagrant-aws
