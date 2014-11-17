#require 'ci/reporter/rake/rspec' 
require 'rake'
require 'rspec/core/rake_task'

desc 'Run specs'
RSpec::Core::RakeTask.new(:spec => ["ci:setup:rspec"]) do |t|
  t.pattern = './spec/**/*_spec.rb'
end

task :default => [:spec]
