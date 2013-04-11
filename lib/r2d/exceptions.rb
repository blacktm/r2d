# exceptions.rb

class LearnRubyError < StandardError
  def initialize(msg)
    puts msg.error
    puts "Occurred in:"
    puts "  " + caller.last, "\n"
  end
end

class String
  def error
    # red => \e[0;31
    # red/bold => \e[1;31m
    "\n\e[1;31m#{self}\e[0m"
  end
end

# Testing exceptions

class SampleException < StandardError
  def initialize(msg="This is an example exception!")
    super(msg)
  end
end
