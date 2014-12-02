#!/usr/bin/env ruby
rails_commit_hash = ENV['RAILS_COMMIT_HASH']

if rails_commit_hash
  puts "Running benchmark using Rails commit #{rails_commit_hash}"
  %x{sed -i "s/gem 'rails'.*/gem 'rails', github: 'rails\\/rails', ref: '"#{rails_commit_hash}"'/g" Gemfile}
end

ruby_version = ENV['RUBY_VERSION']

if ruby_version
  puts "Setting Ruby version to #{ruby_version}"
  system("rbenv global #{ruby_version}")
end

system('bundle install')
