require 'rake/testtask'

class String
  def colorize(c); "\e[#{c}m#{self}\e[0m" end
  def error; colorize("1;31") end
  def bold; colorize("1") end
end

Rake::TestTask.new do |t|
  t.test_files = FileList['test/*_test.rb']
  t.verbose = true
end

desc "Build Gem"
task :build do
  
  print "\nBuilding gem...\n\n".bold
  puts `gem build r2d.gemspec --verbose`
  print "\n...done!\n\n".bold
  
  print "Installing gem...\n\n".bold
  puts `gem install r2d-0.0.0.gem --local --verbose`
  print "\n...done!\n\n".bold
  
end

desc "Test and Build"
task :all do
  Rake::Task["test"].execute
  Rake::Task["build"].execute
end

task :default => :all
