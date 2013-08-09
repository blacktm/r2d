require 'mkmf'

puts "=================================================="
puts Dir.pwd

# $CFLAGS << " -Wall "

if RUBY_PLATFORM =~ /darwin/
  $LDFLAGS << " glfw/osx/libglfw3.a"
  $LDFLAGS << " -framework Cocoa -framework OpenGL -framework IOkit"
end

if RUBY_PLATFORM =~ /mingw/
  $LDFLAGS << " glfw/win32/libglfw3.a"
  $LDFLAGS << " -lopengl32"
  $LDFLAGS << " -lgdi32"
end

create_makefile('r2d/r2d')
