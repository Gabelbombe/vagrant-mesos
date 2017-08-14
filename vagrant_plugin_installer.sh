#!/bin/bash

## test Homebrew
if ! hash brew 2>/dev/null ; then
  echo -e '[info] Installing Homebrew'
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

## test Homebrew
if ! brew tap |grep -q 'caskroom/cask' ; then
  echo -e '[info] Tapping Caskroom'
  brew tap caskroom/cask
fi

if ! hash vagrant 2>/dev/null ; then
  echo -e '[info] Installing Vagrant'
  brew install vagrant
fi

## Assuming ChefDK is NOT installed..
if [ ! -d /opt/chefdk ] ; then
  echo -e '[info] Installing ChefrDK'
  brew cask install chefdk --force
fi

if ! hash wget ; then
  echo -e '[info] Installing WGet'
  brew install wget
fi

if ! hash aws ; then
echo -e '[info] Installing AWS CLI Tools'
  brew install awscli
fi

PLUGINS="$(vagrant plugin list)"
for REQ in omnibus berkshelf hosts cachier aws ; do
  echo "${PLUGINS}" |grep  -q  "${REQ}" || {
    echo -e "[info] Installing Plugin: ${REQ}"
    vagrant plugin install vagrant-${REQ}
  }
done

exit 0
