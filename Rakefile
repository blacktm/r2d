# require 'rspec/core/rake_task'

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

# desc "Run all tests"
# RSpec::Core::RakeTask.new(:spec) do |t|
#   #...
#   puts "\n\e[1;34mRunning tests...\e[0m\n\n"
# end


desc "Build Gem"
task :build do
  
  `clear`
  
  puts "", "Building gem...".task
  `gem build r2d.gemspec`
  
  puts "Installing gem...".task
  `gem install r2d-0.0.0.gem`
  
  puts "Done!".success, ""
  
end

task :default => :build
