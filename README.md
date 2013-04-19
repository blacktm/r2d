# R2D - A Ruby 2D Graphics Interface

# Installing

To install the gem, use:

```
$ gem install r2d
```

# Drawing

Shapes and images can be drawn procedurally using the methods below:

### Available Parameters

```
x = an 'x' coordinate (number)
y = an 'y' coordinate (number)
s = the size   (number)
w = the width  (number)
h = the height (number)
c = the color  (string)
 or...
c = [r, g, b, a]
 where...
  r = red   (number) 0..255
  g = green (number) 0..255
  b = blue  (number) 0..255
  a = alpha (number) 0..255
```

## Shapes

```ruby
R2d::Helpers.draw_line(x1, y1, x2, y2, c)
R2d::Helpers.draw_triangle(x1, y1, x2, y2, x3, y3, c)
R2d::Helpers.draw_square(x, y, s, c)
R2d::Helpers.draw_rect(x, y, w, h, c)
R2d::Helpers.draw_text(x, y, string, c)
```

### Examples

```ruby
R2d::Helpers.draw_line(100, 150, 300, 350, "red")
R2d::Helpers.draw_triangle(200, 50, 100, 300, 400, 300, "orange")
R2d::Helpers.draw_square(10, 30, 50, [255, 255, 100, 150])
R2d::Helpers.draw_rect(20, 20, 40, 40, [0, 255, 0, 255])
R2d::Helpers.draw_text(50, 50, "Hello world!", "blue")
```

## Images

<!-- TODO: Img formats? -->

```ruby
R2d::Helpers.draw_img(x, y, img_path)
```

### Examples

```ruby
R2d::Helpers.draw_img(50, 100, "galaxy.jpg")
```

# Shape and Image Classes

Each shape has an associated class. Shapes can be instantiated and added
to the window using `R2d::Window.add(shape)` and removed with `R2d::Window.remove(shape)`.

## Lines

```ruby
l = R2d::Line.new(x1, y1, x2, y2, c)

l.x1 = 10
l.y1 = 10
l.color = "yellow"

R2d::Window.add(l)
R2d::Window.remove(l)
```

## Triangles

```ruby
t = R2d::Triangle.new(x1, y1, x2, y2, x3, y3, c)

t.color = "green"
t.x3 = 75
t.y3 = 150
```

## Squares

```ruby
s = R2d::Square.new(x, y, s)
s = R2d::Square.new(x, y, s, c)

s.width = 25
s.height = 50
s.color = "red"

R2d::Window.add(s)
```

## Rectangles

```ruby
r = R2d::Rectangle.new(x, y, w, h)
r = R2d::Rectangle.new(x, y, w, h, c)

r.x = 10
r.y = 20
r.width = 200
r.height = 50
r.color = "blue"

R2d::Window.add(r)
```

# Images

```ruby
img = R2d::Image.new(x, y, img_path)

img.x = 10
img.y = 20
```
<!--
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
r = R2d::Rectangle.new(x, y, w, h)

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
t = R2d::Triangle.new(x1, y1, x2, y2, x3, y3)

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
l = R2d::Line.new(x1, y1, x2, y2)

l.gradient = {
  :start => "red",
  :end => "blue",
}
```

-->

# Audio

## Songs

These are long audio clips. (More soon.)

```ruby
s = R2d::Song.new("track.mp3")
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
s = R2d::Sound.new("snare.mp3")
s.play
```

# The Window

## Window Attributes

Attributes change the appearance and behavior of the window. These must be applied before displaying the window with `Window.show`.

Setting the window size:

```ruby
R2d::Window.width = w
R2d::Window.height = h
```

Changing the background color, where `color` is a string or an array of `[r, g, b, a]` values.

```ruby
R2d::Window.background = color
```

Showing the cursor over the window (default = `true`):

```ruby
R2d::Window.cursor = false
```

Setting the title (default = `"Learn Ruby"`):

```ruby
R2d::Window.title = "Hello world!"
```

## Adding/Removing Objects

Objects can be added and removed from the window using:

```ruby
r = R2d::Rectangle.new(50, 50, 100, 100)
R2d::Window.add(r)
R2d::Window.remove(r)
```

Additionally, all objects have an `add` and `remove` convenience method which will do the same:

```ruby
r = R2d::Rectangle.new(50, 50, 100, 100)
r.add
r.remove
```

If an object is already in the window, `add` will return `false`. Similarly, if the object is not in the window, `remove` will return `false`.

```ruby
r = R2d::Rectangle.new(50, 50, 100, 100)

r.add     # true
r.add     # false - already in window
r.remove  # true
r.remove  # false - not in window
```

All objects can be removed from the window using:

```ruby
R2d::Window.clear
```

## Capturing Input

To capture a single key press where `<key_string>` is any valid keyboard character `a..z`, `A..Z`, `0..9`, and string representing arrows, alt, control, shift, etc:

```ruby
R2d::Window.on_key <key_string> do
  #...
end
```

### Examples

```ruby
R2d::Window.on_key 'm' do
  puts "You pressed 'm'"
end

R2d::Window.on_key 'up' do
  puts "Up arrow pressed"
end

R2d::Window.on_key 'space' do
  puts "Spacebar pressed"
end
```

### Mouse Buttons

Mouse input can also be captured using the `'mouse_left'` and `'mouse_right'` strings.

```ruby
R2d::Window.on_key 'mouse_right' do
  puts "Mouse clicked in the window"
end
```

## Keys Pressed Down

To detect whether a key is held down, use either...

```ruby
R2d::Window.key_down <key_string> do
  #...
end
```

or `Window.update`:


```ruby
R2d::Window.update do
  if key_down? <key_string>
    #...
  end
end
```

### Examples

The two examples below are equivalent and both execute in the main update loop.

```ruby
R2d::Window.key_down 'x' do
  puts "'x' pressed at #{Time.now}"
end
```

```ruby
R2d::Window.update do
  if key_down? 'x'
    puts "'x' pressed at #{Time.now}"
  end
end
```

## The Update Loop

The `R2d::Window.update` block represents the main update loop. Anything in this block will update 60 times per second (by default):

```ruby
R2d::Window.update do
  #...
end
```

## Mouse Positions

Mouse positions are relative to the top left corner of the window.

```ruby
R2d::Window.mouse_x  # current 'x' position
R2d::Window.mouse_y  # current 'y' position
```

## Showing the Window

Use `R2d::Window.show` to display the window. This should only be called once.

```ruby
s = R2d::Square.new(100, 100, 50, "red")
s.add

R2d::Window.show
```

# Helpers

The `R2d::Window` class has a number of helpers aliased to aid learning:

 - update
 - on_key
 - key_down

```ruby
update do
  #...
end

key_down 'x' do
  #...
end
```

Visual shapes and images also have knowledge of the `R2d::Window` class, so they can be added and removed from the window using their helper methods.

```ruby
s = R2d::Square.new(x, y, s)

# Add and remove calling the `R2d::Window` class
R2d::Window.add(s)
R2d::Window.remove(s)

# Add and remove using the helper methods
s.add
s.remove
```

# Helpful Snippets

## Get Mouse Position When Changed

```ruby
x = Window.mouse_x

R2d::Window.update do
  if R2d::Window.mouse_x != x
    puts x = R2d::Window.mouse_x
  end
end
```
