require 'rake/testtask'

class String
  def error
    # red => \e[0;31
    # red/bold => \e[1;31m
    "\n\e[0;31m#{self}\e[0m"
  end
  def task
    "\e[1;34m#{self}\e[0m"
  end
  def success
    "\e[0;32m#{self}\e[0m"
  end
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "Build Gem"
task :build do
  
  `clear`
  
  puts "", "Building gem...".task
  `gem build r2d.gemspec`
  
  puts "Installing gem...".task
  `gem install --local r2d-0.0.0.gem`
  
  puts "Done!".success, ""
  
end

desc "Test and Build"
task :all do
  Rake::Task["test"].execute
  Rake::Task["build"].execute
end

task :default => :all
