# require "socket"
# require "csv"
require "yaml"
# require "optparse"
require 'net/http'

require 'logger'
require 'open3'
require 'json'
require 'pp'

class Executor
  def initialize(logger)
    @logger = logger
  end

  def run(cmd)
    output = nil
    Open3.popen3(cmd) do |stdin, stdout, stderr, wait_thr|
      # Process::Status object returned.
      status = wait_thr.value
      if status.exitstatus != 0
        @logger.warn "exitstatus: #{status.exitstatus}"
      end

      output = stdout.read
      @logger.warn output
      @logger.info stderr.read
    end

    output
  end
end

def report_results(file, result)
  http = Net::HTTP.new('rubybench.org')
  request = Net::HTTP::Post.new('/benchmark_runs')

  form_results = {}
  result["entries"].each do |key|
    label = key["label"]
    ips = key["ips"]
    form_results["benchmark_run[result][#{label}]"] = ips
  end

  request.basic_auth(ENV["API_NAME"], ENV["API_PASSWORD"])

  form_results.merge!({
    'benchmark_type[category]' => "rails_#{result["component"]}",
    'benchmark_type[unit]' => 'ips',
    'benchmark_type[script_url]' => "https://raw.githubusercontent.com/ruby-bench/ruby-bench-suite/rails/benchmarks/#{file}",
    'benchmark_run[environment]' => { "ruby_version" => RUBY_VERSION }.to_yaml,
    'commit_hash' => ENV['RAILS_COMMIT_HASH'],
    'repo' => 'rails',
    'organization' => 'tgxworld'
  })
  request.set_form_data(form_results)

  # http.request(request)

  puts form_results.inspect
end

def run(command, opt = nil)
  exit_status =
    if opt == :quiet
      system(command, out: "/dev/null", err: :out)
    else
      system(command, out: $stdout, err: :out)
    end

  exit unless exit_status
end

def parse(raw)
  begin
    JSON.parse(raw)
  rescue JSON::ParserError
    puts "json not parsed: #{raw}"
    nil
  end
end

logger = Logger.new(STDERR)
executor = Executor.new(logger)

benchmarks_path = "/ruby-bench-suite/rails/benchmarks"

STDERR.puts "Bundling..."
executor.run("cd #{benchmarks_path} && bundle install")


Dir.glob(File.join(benchmarks_path, '*.rb')).each do |file|
  STDERR.puts "running #{file}"

  STDERR.puts "Running benchmarks..."
  raw = executor.run("BUNDLE_GEMFILE=/ruby-bench-suite/rails/Gemfile ruby #{file}")
  STDERR.puts "Finished!\n"


  parsed = parse(raw)
  if parsed
    report_results(File.basename(file), parsed)
  end
end
