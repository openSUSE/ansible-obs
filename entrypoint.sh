#!/bin/bash -l

cd ~/ansible-obs

bundle.ruby4.0 config set --local path 'vendor/bundle' &&
bundle.ruby4.0 config set build.nokogiri --use-system-libraries &&
bundle.ruby4.0 install --jobs=4 --retry=3 &&
bundle.ruby4.0 binstubs --force obs_deploy obs_github_deployments &&
/bin/bash -l
