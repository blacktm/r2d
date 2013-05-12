# helpers.rb

module R2D
  module Helpers
    
    def mouse_x
      Adapters.mouse_x
    end
    
    def mouse_y
      Adapters.mouse_y
    end
    
    def on_key(key, &block)
      @current.on_key(key, block)
    end
    
    def key_down?(key)
      @current.key_down?(key)
    end
    
    def key_down(key, &block)
      @current.add_key_down(key, block)
    end
    
    def update(&block)
      @current.update(block)
    end
    
    def window(opts={})
      case opts
      when :show
        @current.show
      when :clear
        @current.clear
      else
        @current = Window.new(
          w: opts[:width] || 640,
          h: opts[:height] || 480,
          bg: opts[:background],
          fs: opts[:fullscreen] || false
        )
      end
    end
  end
end

include R2D::Helpers
