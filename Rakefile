# encoding: utf-8

# cargo-culted from chef-splunk

require 'foodcritic'
require 'foodcritic/rake_task'
require 'rspec/core/rake_task'

require 'rubocop/rake_task'
desc 'Run Rubocop'

desc 'Run Foodcritic lint checks'
FoodCritic::Rake::LintTask.new(:lint) do |t|
  t.options = {
    fail_tags: ['any'],
    tags: []
  }
end

desc 'Run ChefSpec examples'
RSpec::Core::RakeTask.new(:spec)

desc 'Run all tests'
# task test: [:lint, :spec, :rubocop]
task test: [:lint, :spec]
task default: :test

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new

  desc 'Alias for kitchen:all'
  task integration: 'kitchen:all'
  task test_all: [:test, :integration]
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
