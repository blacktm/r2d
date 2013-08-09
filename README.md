
<!--
  
  TODO:
   - Add `include R2D::Helpers` ?
   - Explain how coordinates are numbered, clockwise?
   
-->

# R2D: 2D Graphics for Ruby

R2D is a gem for drawing 2D graphics, animations, playing audio, capturing input, and more. It aims to be a simple and lightweight programmable graphics engine suitable for casual 2D games, visualizations, education, and more.

**WARNING: This gem does not (yet) work!** It's still in very early development and the API and implementation are in flux. I'm openly sharing the source and development process for make benefit of human race, and will (probably) not accept contributions at this time. So there.

If you want to share ideas, ask questions, or discuss anything in general, check out the [Google group](https://groups.google.com/d/forum/r2d-gem). Contact me at [@blacktm](https://twitter.com/blacktm). View the [roadmap](https://github.com/blacktm/r2d/wiki/Roadmap) in the wiki.

# Installing

Until a public release, this gem will only be available locally. Build and install using:

```
$ gem build r2d.gemspec
$ gem install r2d-0.0.0.gem --local
```

# Running the Examples

The [`examples/`](/examples) directory contains a wide variety of sample R2D applications. They should all be consistent with the API spec below, but remember, _**the full API has not yet been implemented!**_ I'm using the examples to test the gem while implementing the engine and API, so I already know what is broken. Don't go opening issues on broken examples, at least for now.

# Requirements and OS Support

R2D requires Ruby 2.0 and greater. Native extensions are used in this gem, so a compiler is needed. The intension of R2D is to be a fully cross-platform graphics environment. The gem has so far been tested on OS X 10.8.4 and Windows 7 32-bit using the [RubyInstaller](http://rubyinstaller.org/) for Windows and the [MinGW DevKit](http://rubyinstaller.org/add-ons/devkit/) (needed for building native extensions). If you've tested R2D with other operating systems and configurations, please [let me know](https://twitter.com/blacktm) and open issues accordingly.

---

## Proposed API Spec (not yet fully implemented)

---

# A Simple R2D Application

```ruby
require 'r2d'

# Create a new window instance
window = R2D::Window.new

# Create a new shape
r = R2D::Rectangle.new(0, 0, 100, 100, "blue")

# Add the shape to the window
window.add(r)

# Show the window
window.show
```

Read the reference below to learn about all the things you can do with R2D. Instance methods with `method/=` means both `method` and `method=` are available to get and set attributes. See the [`examples/`](/examples) directory for sample applications.

# Drawing

R2D supports a number of basic graphics primitives like triangles, squares, and rectanges. Every object that can be drawn has a set of **common parameters**:

```
x = an 'x'  coordinate (Integer)
y = an 'y'  coordinate (Integer)
s = the size    (Integer)
w = the width   (Integer)
h = the height  (Integer)

c = the color  (String)
or...
c = [r, g, b, a] (Array)
  where values are 0 or 1 (Integer) or 0.0..1.0 (Float)
    r = red
    g = green
    b = blue
    a = alpha
```

Objects also have **common instance methods**:

```ruby
# Toggle the visibility of the object
object.hide
object.show
```

## Shapes

<!-- TODO: Provide a description of what shapes are in R2D -->

### Squares

Parameters:

```
x, y, size, color="white", visible=true
```

Instance methods:

```
x/=, y/=, size/=, color/=
```

Examples:

```ruby
s = R2D::Square.new(x, y, size)
s = R2D::Square.new(x, y, size, color, false)

s.x = 10
s.y = 20
s.size = 25
s.color = "red"
s.color = [1, 0, 0, 0.2]
```

### Rectangles

Parameters:

```
x, y, width, height, color="white", visible=true
```

Instance methods:

```
x/=, y/=, width/=, height/=, color/=
```

Examples:

```ruby
r = R2D::Rectangle.new(x, y, width, height)
r = R2D::Rectangle.new(x, y, width, height, color, false)

r.x = 10
r.y = 20
r.width = 200
r.height = 50
r.color = "blue"
r.color = [0, 0, 1, 0.5]
```

### Quadrilaterals

Parameters:

```
x1, y1, x2, y2, x3, y3, x4, y4, color="white", visible=true
```

Instance methods:

```
x1/=, y1/=, x2/=, y2/=, x3/=, y3/=, x4/=, y4/=, color/=
```

Examples:

```ruby
q = R2D::Quad.new(x1, y1, x2, y2, x3, y3, x4, y4)
q = R2D::Quad.new(x1, y1, x2, y2, x3, y3, x4, y4, color, false)

q.x1 = 10
q.y1 = 20
q.color = "blue"
q.color = [0, 0, 1, 0.5]
```

### Triangles

Parameters:

```
x1, y1, x2, y2, x3, y3, color="white", visible=true
```

Instance methods:

```
x1/=, y1/=, x2/=, y2/=, x3/=, y3/=, color/=
```

Examples:

```ruby
t = R2D::Triangle.new(x1, y1, x2, y2, x3, y3)
t = R2D::Triangle.new(x1, y1, x2, y2, x3, y3, color, false)

t.x1 = 10
t.y1 = 20
t.color = "red"
t.color = [0, 0, 1, 1]
```

### Lines

Parameters:

```
x1, y1, x2, y2, color="white", visible=true
```

Examples:

```ruby
l = R2D::Line.new(x1, y1, x2, y2, w)
l = R2D::Line.new(x1, y1, x2, y2, w, color, false)

l.x1 = 10
l.y1 = 20
l.color = "red"
l.color = [0, 0, 1, 1]
```

## Gradients

### Parameters

All gradient methods take a Hash where keys refer to the corners of the shape and values represent the color.

```ruby
{ :corner => color }
```

`:corner` is specific to each shape (described below). `color` is either a string...

```ruby
"red", "blue", "yellow", etc
```
...or an array containing red, green, blue, alpha values 0 or 1 (`Integer`) or 0.0..1.0 (`Float`):

```ruby
[r, g, b, a]

# examples
[1, 0, 0.8, 0.5]
```

### Squares and Rectangles

`:corners` can be these groupings:

```ruby
# vertical
:top, :bottom

# horizontal
:left, :right

# all corners
:top_left, :top_right, :bottom_left, :bottom_right
```

Examples:

```ruby
r.gradient = {
  top: "red",
  bottom: "blue"
}

r.gradient({
  left: [1, 0.8, 0.5, 0.2],
  right: "blue"
}

r.gradient = {
  top_left: "red",
  top_right: "blue",
  bottom_left: "green",
  bottom_right: "yellow"
}
```

### Quadrilaterals

<!-- TODO: Are these clockwise? -->

```ruby
:first, :second, :third, :fourth
```

Examples:

```ruby
q.gradient = {
  first: "red",
  second: "blue",
  third: [0, 0.8, 1, 1],
  fourth: "yellow"
}
```

### Triangles

The triangle gradient method takes a Hash containing keys (symbols) referring to the first, second, and third points of the triangle.

`:corners` are:

<!-- TODO: Are these clockwise? -->

```ruby
:first, :second, :third
```

Examples:

```ruby
t.gradient = {
  first: "red",
  second: "blue",
  third: [0, 0.8, 1, 1]
}
```

### Lines

The line gradient method takes a Hash containing keys (symbols) referring to the start and ends.

`:corners` are:

<!-- TODO: Explain :start == x1, y1 and so on -->

```ruby
:start, :end
```

Examples:

```ruby
l.gradient = {
  start: "red",
  end: "blue",
}
```

## Images

Formats supported: BMP, PNG, JPG.

Parameters:

```
x, y, "path_to_image", visible=true
```

Instance methods:

```
x/=, y/=, width/=, height/=
```

Examples:

```ruby
img = R2D::Image.new(x, y, "ruby.png")
img = R2D::Image.new(x, y, "media/ruby.png", false)

img.x = 10
img.y = 20
img.width = 125
img.height  # returns height
```

## Text

Parameters:

```
x, y, h, "content", c="white", visible=true
```

Instance methods:

```
x/=, y/=, content/=, color/=
```

Examples:

```ruby
t = R2D::Text.new(x, y, 20, "hello world")
t = R2D::Text.new(x, y, 20, "hello world", "blue", false)

t.x = 10
t.y = 20
```

# Playing Audio

Formats include: MP3, AAC, WAV.

<!-- TODO: How does audio work? What C libraries are used. -->

## Songs

These are long audio clips.

Parameters:

```
"path_to_song", volume=10
```

Instance methods:

```
play, playing?, pause, paused?, stop, loop
```

Examples:

```ruby
s = R2D::Song.new("media/track.mp3")
s = R2D::Song.new("media/track.mp3", 5)

s.play
s.playing?  # returns `true`

s.pause
s.paused?   # returns `true`

s.stop
s.play_loop
```

## Sounds

Sounds are short audio clips kept in memory.

Parameters:

```
"path_to_sound", volume=10
```

Instance methods:

```
play, playing?, pause, paused?, stop, loop
```

Examples:

```ruby
s = R2D::Sound.new("media/snare.mp3")
s = R2D::Sound.new("media/snare.mp3", 5)

s.play
s.playing?  # returns `true`

s.pause
s.paused?   # returns `true`

s.stop
s.play_loop
```

# Capturing Input

## Keyboard and Mouse Buttons

To capture a single key press where `<key_string>` is any valid keyboard character `a..z`, `A..Z`, `0..9`, and string representing arrows, alt, control, shift, etc:

In these examples, `window = R2D::Window.new`.

```ruby
window.on_key <key_string> do
  #...
end
```

Example:

```ruby
window.on_key 'a' do
  # letter 'a' pressed
end
```

Do something repeatedly as a key is held down.

```ruby
window.key_down <key_string> do
  #...
end
```

Example:

```ruby
window.key_down 's' do
  # letter 's' held down
end
```

Valid character strings are:

```
('a'..'z') || ('A'..'Z') || ('0'..'9')
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
```

## Cursor Position

Use these methods to get the position of the cursor relative to the top, left corner of the window.

```ruby
         # Returns the mouse:
window.mouse_x  #  x-coordinate
window.mouse_y  #  y-coordinate
```

# The Window

R2D will create and manage window instances for you. Windows are created using `window = R2D::Window.new`.

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
window = R2D::Window.new(title: "My App", width: 300, height: 200, cursor: false)
```

## Clearing the Window

To remove all objects from the window, use:

```ruby
window.clear
```

Note this does not delete the objects themselves – references remain intact. This is equivalent to calling `window.remove(object)`.

# The Update Loop

Do something each time the graphic environment is updated (60 times / second).

```ruby
window.update do
  # do something
end
```

Examples:

```ruby
window.update do
  if key_down? <key_string>
    # do something
  end
end
```
