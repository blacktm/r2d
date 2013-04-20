# helpers.rb

module R2D
  module Helpers    
    def mouse_x
      Window.mouse_x
    end
    
    def mouse_y
      Window.mouse_y
    end
    
    def on_key(key, &block)
      Window.on_key(key, &block)
    end
    
    def key_down?(key)
      Window.key_down?(key)
    end
    
    def key_down(key, &block)
      Window.key_down(key, &block)
    end
    
    def update(&block)
      Window.update(&block)
    end
    
    def window(opts={})
      if opts == :show
        Window.show
      elsif opts == :clear
        Window.clear
      else
        Window.create(width: opts[:width],
                      height: opts[:height],
                      background: opts[:background],
                      fullscreen: opts[:fullscreen])
      end
    end
  end
end

include R2D::Helpers
