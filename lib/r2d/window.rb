# window.rb

module R2D
  class Window
    attr_reader :width, :height, :title, :cursor_x, :cursor_y,
                :frames, :total_ms, :loop_ms, :fps
    
    def initialize(width: 640, height: 480, title: "R2D", fps: 60, vsync: true)
      @width, @height, @title = width, height, title
      @cursor_x = @cursor_y = 0
      @fps_cap = fps
      @vsync = vsync
      
      @objects = []
      @on_keys = {}
      @keys_down = {}
      @update_proc = Proc.new {}
    end
    
    def add(o)
      case o
      when nil
        raise Error, "Cannot add '#{o.class}' to window!"
      when Array
        o.each { |x| add_object(x) }
      else
        add_object(o)
      end
    end
    
    def remove(o)
      if o == nil
        raise Error, "Cannot remove '#{o.class}' from window!"
      end
      
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
    
    def on_key_callback(key)
      key.downcase!
      if @on_keys.has_key? key
        @on_keys[key].call
      end
    end
    
    # Register key string with proc
    def key_down(key, &proc)
      @keys_down[key] = proc
      true
    end
    
    def keys_down_callback(key)
      key.downcase!
      if @keys_down.has_key? key
        @keys_down[key].call
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
