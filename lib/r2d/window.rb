# window.rb

module R2d
  class Window
    # initialize(width, height, fullscreen, update_interval = 16.666666)
    @@window = nil

    def self.create(opts = {})
      w = opts[:width] || 800
      h = opts[:height] || 600
      c = opts[:background]
      fs = opts[:fullscreen]

      if !@@window
        @@window = GosuWindow.new(w, h)
        true
      else
        false
      end
    end

    def self.title=(t)
      self.exists?
      @@window.caption = t
    end

    def self.add(obj)
      self.exists?
      @@window.add(obj)
    end

    def self.remove(obj)
      self.exists?
      @@window.remove(obj)
    end

    def self.clear
      self.exists?
      @@window.clear
    end

    def self.get_color(r, g, b, a)
      self.exists?
      @@window.get_color(r, g, b, a)
    end

    def self.update(&block)
      self.exists?
      @@window.update_proc = block
    end

    def self.on_key(key, &block)
      self.exists?
      begin
        @@window.add_on_key(key, block)
      rescue InvalidKeyError => e
        puts e.message
        puts "Occurred in:"
        puts "  " + e.backtrace.last, "\n"
      end
    end

    def self.key_down?(key)
      self.exists?
      @@window.key_down?(key)
    end

    def self.key_down(key, &block)
      self.exists?
      @@window.add_key_down(key, block)
    end

    def self.mouse_x
      self.exists?
      @@window.mouse_x
    end

    def self.mouse_y
      self.exists?
      @@window.mouse_y
    end

    def self.song(path)
      self.exists?
      @@window.song(path)
    end

    def self.current_song
      self.exists?
      @@window.current_song
    end

    def self.show
      self.exists?
      @@window.show
    end

    private

    def self.exists?
      if !@@window
        raise LearnRubyError, "Window has not yet been created. Use 'Window.create'"
      else
        true
      end
    end

    # def self.exists?
    #   begin
    #     if !@@window
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
