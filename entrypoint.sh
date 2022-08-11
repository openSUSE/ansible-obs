#!/bin/bash -l

cd ~/ansible-obs

bundle.ruby3.1 config set --local path 'vendor/bundle' &&
bundle.ruby3.1 config build.nokogiri --use-system-libraries &&
bundle.ruby3.1 install --jobs=4 --retry=3 &&
bundle.ruby3.1 binstubs --all &&
/bin/bash -l
