require "bundler/gem_tasks"
require "rspec/core/rake_task"

task :console do
  exec "irb -r brickset -I ./lib"
end

task :build do
  exec "gem build brickset.gemspec"
end

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
