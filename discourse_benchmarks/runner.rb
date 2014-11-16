#!/usr/bin/env ruby
rails_commit_hash = ENV['RAILS_COMMIT_HASH']

if rails_commit_hash
  puts "Running benchmark using Rails commit #{rails_commit_hash}"
   %x{sed -i "s/gem 'rails'.*/gem 'rails', git: 'https:\\/\\/github.com\\/rails\\/rails.git', ref: '"#{rails_commit_hash}"'/g" Gemfile}
end

system('bundle install')
