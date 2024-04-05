#!/usr/bin/env bash
# exit on error
set -o errexit
bundle install
bundle exec rake db:migrate
DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bundle exec rake db:reset
bundle exec rake db:seed