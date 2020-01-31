# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"
gem 'bcrypt'
gem 'capybara'
gem 'pg'
gem 'rerun'
gem 'rspec'
gem 'sinatra'

# DELETE FROM bookings z
# USING
#  (
#   SELECT pid
#   from properties WHERE uid = '3722'
# ) a
# where a.pid = z.pid
# returning *;