require 'r2d'

# Create a new window instance
window = R2D::Window.new

# Create a new shape
s = R2D::Square.new(0, 0, 100, "red")

# Add the shape to the window
window.add(s)

# Show the window
window.show
