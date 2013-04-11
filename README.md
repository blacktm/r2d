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
draw_line(x1, y1, x2, y2, c)
draw_triangle(x1, y1, x2, y2, x3, y3, c)
draw_square(x, y, s, c)
draw_rect(x, y, w, h, c)
draw_text(x, y, string, c)
```

### Examples

```ruby
draw_line(100, 150, 300, 350, "red")
draw_triangle(200, 50, 100, 300, 400, 300, "orange")
draw_square(10, 30, 50, [255, 255, 100, 150])
draw_rect(20, 20, 40, 40, [0, 255, 0, 255])
draw_text(50, 50, "Hello world!", "blue")
```

## Images

<!-- TODO: Img formats? -->

```ruby
draw_img(x, y, img_path)
```

### Examples

```ruby
draw_img(50, 100, "galaxy.jpg")
```

# Shape and Image Classes

Each shape has an associated class. Shapes can be instantiated and added to the window using `Window.add(shape)` and removed with `Window.remove(shape)`.

## Lines

```ruby
l = Line.new(x1, y1, x2, y2, c)

l.x1 = 10
l.y1 = 10
l.color = "yellow"

Window.add(l)
Window.remove(l)
```

## Triangles

```ruby
t = Triangle.new(x1, y1, x2, y2, x3, y3, c)

t.color = "green"
t.x3 = 75
t.y3 = 150
```

## Squares

```ruby
s = Square.new(x, y, s)
s = Square.new(x, y, s, c)

s.width = 25
s.height = 50
s.color = "red"

Window.add(s)
```

## Rectangles

```ruby
r = Rectangle.new(x, y, w, h)
r = Rectangle.new(x, y, w, h, c)

r.x = 10
r.y = 20
r.width = 200
r.height = 50
r.color = "blue"

Window.add(r)
```

# Images

```ruby
img = Image.new(x, y, img_path)

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

-->

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

# The Window

## Window Attributes

Attributes change the appearance and behavior of the window. These must be applied before displaying the window with `Window.show`.

Setting the window size:

```ruby
Window.width = w
Window.height = h
```

Changing the background color, where `color` is a string or an array of `[r, g, b, a]` values.

```ruby
Window.background = color
```

Showing the cursor over the window (default = `true`):

```ruby
Window.cursor = false
```

Setting the title (default = `"Learn Ruby"`):

```ruby
Window.title = "Hello world!"
```

## Adding/Removing Objects

Objects can be added and removed from the window using:

```ruby
r = Rectangle.new(50, 50, 100, 100)
Window.add(r)
Window.remove(r)
```

Additionally, all objects have an `add` and `remove` convenience method which will do the same:

```ruby
r = Rectangle.new(50, 50, 100, 100)
r.add
r.remove
```

If an object is already in the window, `add` will return `false`. Similarly, if the object is not in the window, `remove` will return `false`.

```ruby
r = Rectangle.new(50, 50, 100, 100)

r.add     # true
r.add     # false - already in window
r.remove  # true
r.remove  # false - not in window
```

All objects can be removed from the window using:

```ruby
Window.clear
```

## Capturing Input

To capture a single key press where `<key_string>` is any valid keyboard character `a..z`, `A..Z`, `0..9`, and string representing arrows, alt, control, shift, etc:

```ruby
Window.on_key <key_string> do
  #...
end
```

### Examples

```ruby
Window.on_key 'm' do
  puts "You pressed 'm'"
end

Window.on_key 'up' do
  puts "Up arrow pressed"
end

Window.on_key 'space' do
  puts "Spacebar pressed"
end
```

### Mouse Buttons

Mouse input can also be captured using the `'mouse_left'` and `'mouse_right'` strings.

```ruby
Window.on_key 'mouse_right' do
  puts "Mouse clicked in the window"
end
```

## Keys Pressed Down

To detect whether a key is held down, use either...

```ruby
Window.key_down <key_string> do
  #...
end
```

or `Window.update`:


```ruby
Window.update do
  if key_down? <key_string>
    #...
  end
end
```

### Examples

The two examples below are equivalent and both execute in the main update loop.

```ruby
Window.key_down 'x' do
  puts "'x' pressed at #{Time.now}"
end
```

```ruby
Window.update do
  if key_down? 'x'
    puts "'x' pressed at #{Time.now}"
  end
end
```

## The Update Loop

The `Window.update` block represents the main update loop. Anything in this block will update 60 times per second (by default):

```ruby
Window.update do
  #...
end
```

## Mouse Positions

Mouse positions are relative to the top left corner of the window.

```ruby
Window.mouse_x  # current 'x' position
Window.mouse_y  # current 'y' position
```

## Showing the Window

Use `Window.show` to display the window. This should only be called once.

```ruby
s = Square.new(100, 100, 50, "red")
s.add

Window.show
```

# Helpers

The `Window` class has a number of helpers aliased to aid learning:

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

Visual shapes and images also have knowledge of the `Window` class, so they can be added and removed from the window using their helper methods.

```ruby
s = Square.new(x, y, s)

# Add and remove calling the `Window` class
Window.add(s)
Window.remove(s)

# Add and remove using the helper methods
s.add
s.remove
```

# Helpful Snippets

## Get Mouse Position When Changed

```ruby
x = Window.mouse_x

Window.update do
  if Window.mouse_x != x
    puts x = Window.mouse_x
  end
end
```
