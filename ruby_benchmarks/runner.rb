#!/usr/bin/env ruby
ruby_version = ENV['RUBY_VERSION']

if ruby_version
  puts "Setting Ruby version to #{ruby_version}"
  system("rbenv global #{ruby_version}")
end
