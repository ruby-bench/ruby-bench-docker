#!/usr/bin/env ruby

require 'digest'
require 'shellwords'

file = ARGV[0]
name = ENV["SCRIPT_NAME"]
script_url = ENV["SCRIPT_URL"]

ENV['REPO_NAME'] = 'ruby'
ENV['ORGANIZATION_NAME'] = 'ruby'
ENV['BENCHMARK_TYPE_DIGEST'] = Digest::SHA2.file(file).hexdigest
ENV['BENCHMARK_TYPE_SCRIPT_URL'] = script_url
ENV['RUBY_ENVIRONMENT'] = 'true'
ENV['LANG'] = 'C.UTF-8'

ips_command = [
  "benchmark-driver", file,
  "-e", "#{name}::#{RbConfig.ruby.shellescape}",
  "-e", "#{name}_jit::#{RbConfig.ruby.shellescape} --jit",
  "--runner", "ips",
  "--output", "rubybench", 
  "--repeat-count", "1", 
  "--repeat-result", "best",
  "--timeout", "60"
]

rsskb_command = [
  "benchmark-driver", file,
  "-e", "rss_kb::#{RbConfig.ruby.shellescape}",
  "--runner", "rsskb",
  "--output", "rubybench", 
  "--repeat-count", "1", 
  "--repeat-result", "best",
  "--timeout", "60"
]

puts "+ #{ips_command.shelljoin}"
unless system(ips_command.shelljoin)
  puts "Failed to execute: #{ips_command.shelljoin}"
end

puts "+ #{rsskb_command.shelljoin}"
unless system(rsskb_command.shelljoin)
  puts "Failed to execute: #{rsskb_command.shelljoin}"
end
