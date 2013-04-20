# gosu.rb

require 'gosu'

module R2D
  module Adapters
    class GosuAdapter < ::Gosu::Window
      attr_writer :update_proc, :cursor

      def initialize(w=800, h=600, fs=false)
        # super 800, 600, false
        super w, h, fs

        self.caption = "R2D"

        @cursor = true
        @objects = []
        @on_keys = {}
        @keys_down = {}
        @update_proc = Proc.new {}
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
        @objects = []
      end

      def get_color(r, g, b, a)
        Gosu::Color.argb(a, r, g, b)
      end

      def background=(c)
      end

      def add_on_key(key, proc)
        @on_keys[key_lookup(key)] = proc
      end

      def key_down?(key)
        button_down?(key_lookup(key))
      end

      def add_key_down(key, proc)
        @keys_down[key_lookup(key)] = proc
      end

      def song(path)
        Gosu::Song.new(self, path)
      end

      def current_song
        Gosu::Song.current_song
      end

      private

      def key_lookup(key)
        case key
        when 'up'
          id = Gosu::KbUp
        when 'down'
          id = Gosu::KbDown
        when 'left'
          id = Gosu::KbLeft
        when 'right'
          id = Gosu::KbRight

        when 'left_alt'
          id = Gosu::KbLeftAlt
        when 'right_alt'
          id = Gosu::KbRightAlt
        when 'left_control'
          id = Gosu::KbLeftControl
        when 'right_control'
          id = Gosu::KbRightControl
        when 'left_shift'
          id = Gosu::KbLeftShift
        when 'right_shift'
          id = Gosu::KbRightShift

        when 'backspace'
          id = Gosu::KbBackspace
        when 'delete'
          id = Gosu::KbDelete
        when 'space'
          id = Gosu::KbSpace
        when 'tab'
          id = Gosu::KbTab
        when 'return'
          id = Gosu::KbReturn

        when 'mouse_left'
          id = Gosu::MsLeft
        when 'mouse_right'
          id = Gosu::MsRight

        when ('a'..'z') || ('A'..'Z') || ('0'..'9')
          id = char_to_button_id(key)
        else
          raise LearnRubyError, "The key '#{key}' is not valid!"
        end
      end

      # Gosu Methods

      def needs_cursor?; @cursor end

      def button_down(id)
        if id == Gosu::KbEscape
          close
        elsif @on_keys.has_key? id
          @on_keys[id].call
        end
      end

      def update
        @update_proc.call

        @keys_down.each_key do |id|
          if button_down? id
            @keys_down[id].call
          end
        end
      end

      def draw
        @objects.each do |o|
          case o
          when Line
            draw_line(
              o.x1, o.y1, o.c1,
              o.x2, o.y2, o.c2
            )
          when Triangle
            draw_triangle(
              o.x1, o.y1, o.c1,
              o.x2, o.y2, o.c2,
              o.x3, o.y3, o.c3
            )
          when Quad
            draw_quad(
              o.x1, o.y1, o.c1,
              o.x2, o.y2, o.c2,
              o.x3, o.y3, o.c3,
              o.x4, o.y4, o.c4
            )
          when Image
            o.draw
          else
            # TODO: raise exception; not valid type
          end
        end
      end

    end
  end
end
