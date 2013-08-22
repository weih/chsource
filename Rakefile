require "bundler/gem_tasks"
require 'rake/testtask'

desc 'Default: rake test.'
task :default => :test

desc 'run unit tests.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'test'
  t.pattern = 'test/**/*_test.rb'
end
