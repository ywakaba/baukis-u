#!/bin/bash

version="5.2.2"

source /usr/local/share/chruby/chruby.sh
chruby $(cat ~/.ruby-version)

if [[ ! -d ${GEM_HOME}/gems/rails-${version}/ ]]; then
  gem install rails --version=${version} --no-ri --no-rdoc --verbose
fi
