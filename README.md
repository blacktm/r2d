# R2D: A Ruby 2D Graphics Interface

R2D is a graphics interface for drawing 2D graphics, animations, playing audio, capturing input, and more. It's like [Rack](http://rack.github.io), but for graphics.

# Contributing

This library is in **very early development**, which means the design direction, implementation, and final API spec is still in flux. Please [contact me](https://twitter.com/blacktm) or open an issue *before* sending a pull request.

# Installing

Until a v0.1.0 release, this gem will only be available locally. To build and install the gem, use:

```
$ gem build r2d.gemspec
$ gem install r2d-0.0.0.gem
```

# A Simple R2D Application

```ruby
require 'r2d'

# Configure and initialize the window
window width: 640, height: 480

# Create a shape and add it to the window
r = Rectangle.new(0, 0, 100, 100, "blue")

# Show the window
window :show
```

That's a basic R2D application. Read the reference below to learn about all the things you can do with R2D. See the [examples](/examples) directory for more sample applications to try.

# Basic Drawing

## Common Parameters

```
x = an 'x' coordinate (number)
y = an 'y' coordinate (number)
s = the size   (number)
w = the width  (number)
h = the height (number)

c = the color  (string)
or...
c = [r, g, b, a] (array)
  where...
   r = red   (number) 0..255
   g = green (number) 0..255
   b = blue  (number) 0..255
   a = alpha (number) 0..255
```

## Shapes

### Squares

Parameters:

```
x, y, size, color="white", visible=true
```

Examples:

```ruby
s = Square.new(x, y, size)
s = Square.new(x, y, size, color, false)

s.x = 10
s.y = 20
s.width = 25
s.height = 50
s.color = "red"
s.color = [250, 0, 0, 100]
```

### Rectangles

Parameters:

```
x, y, width, height, color="white", visible=true
```

Examples:

```ruby
r = Rectangle.new(x, y, width, height)
r = Rectangle.new(x, y, width, height, color, false)

r.x = 10
r.y = 20
r.width = 200
r.height = 50
r.color = "blue"
r.color = [0, 0, 255, 150]
```

# Capturing Input

## Keyboard and Mouse Buttons

Do something one time when a key is pressed.

```ruby
on_key 'a' do
  # letter 'a' pressed
end
```

Do something repeatedly as a key is held down.

```ruby
key_down 's' do
  # letter 's' held down
end
```

Valid character strings:

```
'up'
'down'
'left'
'right'
'left_alt'
'right_alt'
'left_control'
'right_control'
'left_shift'
'right_shift'
'backspace'
'delete'
'space'
'tab'
'return'
'mouse_left'
'mouse_right'
('a'..'z') || ('A'..'Z') || ('0'..'9')
```

## Cursor Position

Use these helper methods to get the position of the cursor.

```ruby
         # Returns the mouse:
mouse_x  #  x-coordinate
mouse_y  #  y-coordinate
```

# The Window

R2D will create and manage a window instance for you.

## Window Attributes

Attributes change the appearance and behavior of the window. These are applied before drawing is done.

```ruby
                     # Defaults:
title: "My App"      #  "R2D"
width: 400           #  640
height: 300          #  480
cursor: false        #  `true`
background: "white"  #  "black"
```

Example:

```ruby
window title: 'My App', width: 300, height: 200, cursor: false
```

## Clearing the Window

To remove all objects from the window, use:

```ruby
window :clear
```

Note this does not delete the objects themselves – the references remain intact. This is equivalent to calling `shape.remove`.

# The Update Loop

Do something each time the graphic environment is updated (60 times / second).

```ruby
update do
  # do something
end
```









<!--

## Images

TODO: Img formats supported?

## Lines

```ruby
l = Line.new(x1, y1, x2, y2, c)

l.x1 = 10
l.y1 = 10
l.color = "yellow"
```

## Triangles

```ruby
t = Triangle.new(x1, y1, x2, y2, x3, y3, c)

t.color = "green"
t.x3 = 75
t.y3 = 150
```

# Images

```ruby
img = Image.new(x, y, img_path)

img.x = 10
img.y = 20
```

# Gradients

## Parameters

All gradient methods take a Hash where keys refer to the corners of the shape, and values represent the color.

```ruby
{ :corner => color }
```

`:corner` is specific to each shape (described below). `color` is either a string...

```ruby
"red", "blue", "yellow", etc
```
...or an array containing red, green, blue, alpha values from 0 to 255:

```ruby
[r, g, b, a]

# examples
[255, 0, 0, 255]
[100, 100, 200, 150]
```

## Squares and Rectangles

`:corners` can be these groupings:

```ruby
# vertical
:top, :bottom

# horizontal
:left, :right

# all corners
:top_left, :top_right, :bottom_left, :bottom_right
```

### Examples

```ruby
r = Rectangle.new(x, y, w, h)

r.gradient = {
  :top => "red",
  :bottom => "blue"
}

r.gradient({
  :left => [255, 200, 150, 50],
  :right => "blue"
}

r.gradient = {
  :top_left => "red",
  :top_right => "blue",
  :bottom_left => "green",
  :bottom_right => "yellow"
}
```

## Triangles

The triangle gradient method takes a Hash containing keys (symbols) referring to the first, second, and third points of the triangle.

`:corners` are:

```ruby
:first, :second, :third
```

### Examples

```ruby
t = Triangle.new(x1, y1, x2, y2, x3, y3)

t.gradient = {
  :first => "red",
  :second => "blue",
  :third => [0, 200, 255, 255]
}
```

## Lines

The line gradient method takes a Hash containing keys (symbols) referring to the start and ends.

`:corners` are:

```ruby
:start, :end
```

### Examples

```ruby
l = Line.new(x1, y1, x2, y2)

l.gradient = {
  :start => "red",
  :end => "blue",
}
```

# Audio

## Songs

These are long audio clips. (More soon.)

```ruby
s = Song.new("track.mp3")
s.play
s.playing?  # true
s.pause
s.paused?   # true
s.stop
s.loop
```

## Sounds

Sounds are short audio clips. (More soon.)

```ruby
s = Sound.new("snare.mp3")
s.play
```

## Capturing Input

To capture a single key press where `<key_string>` is any valid keyboard character `a..z`, `A..Z`, `0..9`, and string representing arrows, alt, control, shift, etc:

```ruby
on_key <key_string> do
  #...
end
```

### Examples

```ruby
on_key 'm' do
  puts "You pressed 'm'"
end

on_key 'up' do
  puts "Up arrow pressed"
end

on_key 'space' do
  puts "Spacebar pressed"
end
```

### Mouse Buttons

Mouse input can also be captured using the `'mouse_left'` and `'mouse_right'` strings.

```ruby
on_key 'mouse_right' do
  puts "Mouse clicked in the window"
end
```

## Keys Pressed Down

To detect whether a key is held down, use either...

```ruby
key_down <key_string> do
  #...
end
```

or `Window.update`:


```ruby
update do
  if key_down? <key_string>
    #...
  end
end
```

### Examples

The two examples below are equivalent and both execute in the main update loop.

```ruby
key_down 'x' do
  puts "'x' pressed at #{Time.now}"
end
```

```ruby
update do
  if key_down? 'x'
    puts "'x' pressed at #{Time.now}"
  end
end
```

## The Update Loop

The `R2D::Window.update` block represents the main update loop. Anything in this block will update 60 times per second (by default):

```ruby
update do
  #...
end
```

## Mouse Positions

Mouse positions are relative to the top left corner of the window.

```ruby
mouse_x  # current 'x' position
mouse_y  # current 'y' position
```

-->