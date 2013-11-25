# window.rb

module R2D
  class Window
    attr_reader :width, :height, :title, :cursor_x, :cursor_y
    
    def initialize(width: 640, height: 480, title: "R2D")
      @width, @height, @title = width, height, title
      @cursor_x = @cursor_y = 0
      
      @objects = []
      @on_keys = {}
      @keys_down = {}
      @update_proc = Proc.new {}
    end
    
    def add(o)
      if o.class == Array
        o.each { |x| add_object(x) }
      else
        add_object(o)
      end
    end
    
    def remove(o)
      if i = @objects.index(o)
        @objects.slice!(i)
        true
      else
        false
      end
    end
    
    def clear
      @objects.clear
    end
    
    # Register key string with proc
    def on_key(key, &proc)
      @on_keys[key] = proc
      true
    end
    
    def key_callback(key)
      key.downcase!
      if @on_keys.has_key? key
        @on_keys[key].call
      end
    end
    
    def update(&proc)
      @update_proc = proc
      true
    end
    
    def update_callback
      @update_proc.call
    end
    
    private
    
    def add_object(o)
      if !@objects.include?(o)
        @objects.push(o)
        true
      else
        false
      end
    end
    
  end
end
