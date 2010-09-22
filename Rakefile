require 'bundler/setup'
Bundler.require(:default, :development)
require 'rspec/core/rake_task'

task :default => :spec

RSpec::Core::RakeTask.new

namespace :spec do
  RSpec::Core::RakeTask.new :rcov do |task|
    task.rcov      = true
    task.rcov_opts = "--exclude spec/*,gems/*"
  end
end
