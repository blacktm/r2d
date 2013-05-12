# gosu.rb

require 'gosu'

module R2D
  module Adapters
    module Gosu
      
      @gosu_window = nil
      
      def self.create_window(window)
        @gosu_window = GosuWindow.new(window)
      end
      
      def self.show_window
        @gosu_window.show
      end
      
      def self.mouse_x; @gosu_window.mouse_x end
      def self.mouse_y; @gosu_window.mouse_y end
      
      def self.get_color(r, g, b, a); ::Gosu::Color.argb(a, r, g, b) end
      
      def self.song(path); ::Gosu::Song.new(@gosu_window, path) end
      
      def self.current_song; ::Gosu::Song.current_song end
      
      def self.sound(path); ::Gosu::Sample.new(@gosu_window, path) end
      
      def self.image(path); ::Gosu::Image.new(@gosu_window, path, true) end
      
      def self.text(h, font)
        if font == 'default' then font = ::Gosu::default_font_name end
        ::Gosu::Font.new(@gosu_window, font, h)
      end
      
      def self.key_id(key)
        case key
        when 'up'
          id = ::Gosu::KbUp
        when 'down'
          id = ::Gosu::KbDown
        when 'left'
          id = ::Gosu::KbLeft
        when 'right'
          id = ::Gosu::KbRight
          
        when 'left_alt'
          id = ::Gosu::KbLeftAlt
        when 'right_alt'
          id = ::Gosu::KbRightAlt
        when 'left_control'
          id = ::Gosu::KbLeftControl
        when 'right_control'
          id = ::Gosu::KbRightControl
        when 'left_shift'
          id = ::Gosu::KbLeftShift
        when 'right_shift'
          id = ::Gosu::KbRightShift
          
        when 'backspace'
          id = ::Gosu::KbBackspace
        when 'delete'
          id = ::Gosu::KbDelete
        when 'space'
          id = ::Gosu::KbSpace
        when 'tab'
          id = ::Gosu::KbTab
        when 'return'
          id = ::Gosu::KbReturn
          
        when 'mouse_left'
          id = ::Gosu::MsLeft
        when 'mouse_right'
          id = ::Gosu::MsRight
          
        when ('a'..'z') || ('A'..'Z') || ('0'..'9')
          id = @gosu_window.char_to_button_id(key)
        else
          raise Error, "The key '#{key}' is not valid!"
        end
      end
      
      class GosuWindow < ::Gosu::Window
        
        attr_accessor :window
        
        def initialize(window)
          # super 800, 600, false
          super window.w, window.h, window.fs
          
          self.caption = window.title
          @cursor = window.cursor
          @window = window
        end
        
        # Gosu Methods
        
        def needs_cursor?; @cursor end
        
        def button_down(id)
          if id == ::Gosu::KbEscape
            close
          elsif @window.on_keys.has_key? id
            @window.on_keys[id].call
          end
        end
        
        def update
          @window.update_proc.call
          
          @window.keys_down.each_key do |id|
            if button_down? id
              @window.keys_down[id].call
            end
          end
        end
        
        def draw
          @window.objects.each do |o|
            case o
            when Line
              draw_quad(
                o.qx1, o.qy1, o.c1.adapter,
                o.qx2, o.qy2, o.c2.adapter,
                o.qx3, o.qy3, o.c3.adapter,
                o.qx4, o.qy4, o.c4.adapter
              )
            when Triangle
              draw_triangle(
                o.x1, o.y1, o.c1.adapter,
                o.x2, o.y2, o.c2.adapter,
                o.x3, o.y3, o.c3.adapter
              )
            when Quad
              draw_quad(
                o.x1, o.y1, o.c1.adapter,
                o.x2, o.y2, o.c2.adapter,
                o.x3, o.y3, o.c3.adapter,
                o.x4, o.y4, o.c4.adapter
              )
            when Image
              # .draw(x, y, z, factor_x=1, factor_y=1, color=0xffffffff, mode=:default)
              o.adapter.draw(o.x, o.y, 0, o.f_x, o.f_y)
            when Text
              # .draw(text, x, y, z, factor_x=1, factor_y=1, color=0xffffffff, mode=:default)
              o.adapter.draw(o.content, o.x, o.y, 0, 1, 1, o.c.adapter)
            else
              raise Error, "Cannot draw type '#{o.class}'"
            end
          end
        end
        
      end
      
    end
  end
end
