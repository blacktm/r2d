# adapters.rb

module R2D
  module Adapters
    
    @active = nil
    
    def self.create(window, kind)
      if !@active
        case kind
        when :gosu
          @active = Gosu
          @active.create_window(window)
        end
        true
      else
        false
      end
    end
    
    def self.show
      @active.show_window
    end
    
    def self.key_lookup(key); Gosu.key_id(key) end
    
    def self.get_color(r, g, b, a); Gosu.get_color(r, g, b, a) end
    
    def self.mouse_x; Gosu.mouse_x end
    def self.mouse_y; Gosu.mouse_y end
    
    # Fix these:
    
    def self.song(path); @active.song(path) end
    
    def self.current_song; @active.current_song end
    
    def self.sound(path); @active.sound(path) end
    
    def self.image(path); @active.image(path) end
    
    def self.text(h=20, font='default'); @active.text(h, font) end
    
  end
end
