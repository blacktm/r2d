require 'mkmf'

class String
  def colorize(c); "\e[#{c}m#{self}\e[0m" end
  def error; colorize("1;31") end
  def bold; colorize("1") end
end

def print_errors(errors)
  puts %Q[
#{"== R2D Installation Errors =================================".bold}
  
  R2D found some problems and was not installed:
  
  #{errors.join("\n  ")}
  
#{"============================================================".bold}
]
end

def check_libs
  lsdl2       = have_library "SDL2"
  lsdl2_image = have_library "SDL2_image"
  lsdl2_mixer = have_library "SDL2_mixer"
  lsdl2_ttf   = have_library "SDL2_ttf"
  
  errors = []
  
  msg = "Could not find library"
  unless lsdl2 then errors       << "#{msg} SDL2".error       end
  unless lsdl2_image then errors << "#{msg} SDL2_image".error end
  unless lsdl2_mixer then errors << "#{msg} SDL2_mixer".error end
  unless lsdl2_ttf then errors   << "#{msg} SDL2_ttf".error   end
  
  unless errors.empty?
    print_errors(errors)
    exit
  end
end

# Call with `-- --use-system-libs`
if ARGV.include? "--use-system-libs"
  check_libs
  $LDFLAGS << " -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf"
  
elsif RUBY_PLATFORM =~ /darwin/
  
  # Check for Homebrew
  if `which brew`.empty?
    errors = ["Could not find Homebrew.".error,
      "  R2D requires Homebrew on OS X.",
      "  For installation instructions, go to #{"http://brew.sh".bold}"]
    print_errors(errors)
    exit
  end
  
  # Install SDL2 libs via Homebrew
  `brew update`
  `brew install sdl2 sdl2_image sdl2_mixer sdl2_ttf`
  `brew upgrade sdl2 sdl2_image sdl2_mixer sdl2_ttf`
  
  # Check if libs were installed
  check_libs
  
  $LDFLAGS << " -lSDL2 -lSDL2_image -lSDL2_mixer -lSDL2_ttf"
  
elsif RUBY_PLATFORM =~ /mingw/
  # ...
end

create_makefile('r2d/r2d')
