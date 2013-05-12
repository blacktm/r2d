# window.rb

module R2D
  class Window
    
    attr_accessor :w, :h, :title, :bg, :cursor, :fs
    attr_reader :objects, :on_keys, :keys_down, :update_proc
    
    def initialize(w: 640, h: 480, title: "R2D", bg: nil, cursor: true, fs: false)
      @w, @h, @title, @bg, @cursor, @fs, = w, h, title, bg, cursor, fs
      
      @objects = []
      @on_keys = {}
      @keys_down = {}
      @update_proc = Proc.new {}
      
      Adapters.create(self, :gosu)
      
      @@current = self
    end
    
    def self.add(o)
      @@current.add(o)
    end
    
    def self.remove(o)
      @@current.remove(o)
    end
    
    def add(o)
      if !@objects.include?(o)
        @objects.push(o)
        true
      else
        false
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
    
    def add_on_key(key, proc)
      @on_keys[Adapters.key_lookup(key)] = proc
    end
    
    def key_down?(key)
      button_down?(Adapters.key_lookup(key))
    end
    
    def add_key_down(key, proc)
      @keys_down[Adapters.key_lookup(key)] = proc
    end
    
    def update(block)
      @update_proc = block
    end
    
    def on_key(key, block)
      # begin
        add_on_key(key, block)
      # rescue InvalidKeyError => e
      # rescue Exception => e
      #   puts e.message
      #   puts "Occurred in:"
      #   puts "  " + e.backtrace.last, "\n"
      # end
    end
    
    def mouse_x
      Adapters.mouse_x
    end
    
    def mouse_y
      Adapters.mouse_y
    end
    
    def show
      Adapters.show
    end
    
  end
end
