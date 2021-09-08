#!/bin/bash

cd /home/$USER/ansible-obs
bundle install --deployment --binstubs

echo "Have a lot of fun"

bash -i
