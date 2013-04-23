# window.rb

module R2D
  module Window
    # initialize(width, height, fullscreen, update_interval = 16.666666)
    @adapter = nil
    
    def self.create(width = 800, height = 600, background = nil, fullscreen = false)
      if !@adapter
        @adapter = Adapters::GosuAdapter.new(width, height)
        true
      else
        false
      end
    end
    
    def self.title=(t)
      self.exists?
      @adapter.caption = t
    end
    
    def self.add(obj)
      self.exists?
      @adapter.add(obj)
    end
    
    def self.remove(obj)
      self.exists?
      @adapter.remove(obj)
    end
    
    def self.clear
      self.exists?
      @adapter.clear
    end
    
    def self.get_color(r, g, b, a)
      self.exists?
      @adapter.get_color(r, g, b, a)
    end
    
    def self.update(&block)
      self.exists?
      @adapter.update_proc = block
    end
    
    def self.on_key(key, &block)
      self.exists?
      begin
        @adapter.add_on_key(key, block)
      rescue InvalidKeyError => e
        puts e.message
        puts "Occurred in:"
        puts "  " + e.backtrace.last, "\n"
      end
    end
    
    def self.key_down?(key)
      self.exists?
      @adapter.key_down?(key)
    end
    
    def self.key_down(key, &block)
      self.exists?
      @adapter.add_key_down(key, block)
    end
    
    def self.mouse_x
      self.exists?
      @adapter.mouse_x
    end
    
    def self.mouse_y
      self.exists?
      @adapter.mouse_y
    end
    
    def self.song(path)
      self.exists?
      @adapter.song(path)
    end
    
    def self.current_song
      self.exists?
      @adapter.current_song
    end
    
    def self.show
      self.exists?
      @adapter.show
    end
    
    private
    
    def self.exists?
      if !@adapter
        raise R2DError, "Window has not yet been created. Use 'Window.create'"
      else
        true
      end
    end
    
    # def self.exists?
    #   begin
    #     if !@adapter
    #       raise WindowError, "Window has not yet been created. Use 'Window.create'"
    #     end
    #   rescue WindowError => e
    #     puts e.message
    #     puts "Occurred in:"
    #     puts "  " + e.backtrace.last, "\n"
    #     exit
    #   end
    #   return true
    # end
    
  end
end
