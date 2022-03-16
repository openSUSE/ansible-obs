#!/bin/bash

cd /home/$USER/ansible-obs
bundle.ruby3.1 config build.nokogiri --use-system-libraries && bundle.ruby3.1 install --deployment --binstubs

echo "Have a lot of fun"

bash -i
