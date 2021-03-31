#!/bin/bash

cd /home/$USER/ansible-obs
bundle install --deployment --binstubs
bundle exec gem install bundler -v '~> 2.2'
export GEM_PATH=vendor/bundle/ruby/2.7.0:$GEM_PATH

echo "Have a lot of fun"

bash -i
