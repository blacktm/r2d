require 'io/wait'
require 'r2d'

class String
  def error
    # red => \e[0;31
    # red/bold => \e[1;31m
    "\e[0;31m#{self}\e[0m"
  end
  def task
    "\e[1;34m#{self}\e[0m"
  end
  def success
    "\e[0;32m#{self}\e[0m"
  end
end

window width: 640, height: 480

_activity = Square.new(630, 470, 10, 'white')

_c = 0
_switch = true

update do
  
  if _switch
    _c += 2
    if _c > 255
      _switch = false
    end
  else 
    _c -= 2
    if _c < 0
      _switch = true
    end
  end
  
  _activity.color = [255, 255, 255, _c]
  
  if STDIN.ready?
    str = STDIN.gets
    begin
      r = eval(str, TOPLEVEL_BINDING)
      STDOUT.puts r.to_s
      STDOUT.flush
    rescue Exception => e
      STDOUT.puts e.to_s.error
      STDOUT.flush
    end
  end
  
end

window :show
