require 'bundler/gem_tasks'
require 'rspec/core/rake_task'

RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = '--format documentation --color --require spec_helper'
end

desc 'Create Vagrant VM (required for running the tests)'
task :create_vm do
  ENV['VAGRANT_CWD'] = File.expand_path('spec/support')
  p `vagrant up`
end

desc "Destroy Vagrant VM (once you're done with testing)"
task :destroy_vm do
  ENV['VAGRANT_CWD'] = File.expand_path('spec/support')
  p `vagrant destroy -f`
end

task :default => :spec
