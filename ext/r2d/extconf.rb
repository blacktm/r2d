require 'mkmf'

class String
  def colorize(c); "\e[#{c}m#{self}\e[0m" end
  def error; colorize("1;31") end
  def bold; colorize("1") end
end

# Check for libraries
lsdl2       = have_library "SDL2"
lsdl2_image = have_library "SDL2_image"
  # SDL2_image dependencies: jpeg, libp, libpng, libtiff, webp
lsdl2_mixer = have_library "SDL2_mixer"
lsdl2_ttf   = have_library "SDL2_ttf"

errors = []

unless lsdl2 then errors       << "Could not find SDL2".error       end
unless lsdl2_image then errors << "Could not find SDL2_image".error end
unless lsdl2_mixer then errors << "Could not find SDL2_mixer".error end
unless lsdl2_ttf then errors   << "Could not find SDL2_ttf".error   end

unless errors.empty?
  puts %Q[
#{"== R2D Installation Errors =======================".bold}
  
  R2D found some problems and was not installed.
  
  #{errors.join("\n  ")}
  
#{"==================================================".bold}
]
  exit
end

$LDFLAGS << " -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf"

if RUBY_PLATFORM =~ /darwin/
end

if RUBY_PLATFORM =~ /mingw/
end

create_makefile('r2d/r2d')
