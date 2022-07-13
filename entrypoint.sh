#!/bin/bash

cd /home/$USER/ansible-obs
bundle.ruby3.1 config set --local deployment 'true' &&
bundle.ruby3.1 config build.nokogiri --use-system-libraries &&
bundle.ruby3.1 install &&
bundle.ruby3.1 binstubs --all

echo "Have a lot of fun"

bash -i
