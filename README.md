# R2D: 2D Graphics for Ruby

R2D is a gem for drawing 2D graphics, animations, playing audio, capturing input, and more. It aims to be a simple and lightweight programmable graphics engine suitable for casual 2D games, visualizations, education, and more.

**WARNING: This gem is still under development!** This means the API and implementation are very much in flux. Review the latest API [documentation](http://www.ruby2d.com/docs) and the [change log](http://www.ruby2d.com/docs/history.html) for more info.

To share ideas, ask questions, or discuss anything in general, check out the [Google group](https://groups.google.com/d/forum/r2d-gem). Tweet me (the author) at [@blacktm](https://twitter.com/blacktm). [View the R2D website](http://www.ruby2d.com) for news and updates. *This site is also still under development.*

# Installing

This gem uses [SDL2](http://www.libsdl.org) and currently requires libs to be accessible via your `$PATH`, i.e. can compile using `-lSDL2` arguments. The [`extconf.rb`](/ext/r2d/extconf.rb) will check to make sure libs are available during the `gem install` process. If you're on OS X, you can install the following SDL2 libs using [Homebrew](http://brew.sh):

```
$ brew install sdl2 sdl2_image sdl2_mixer sdl2_ttf
```

If you have an idea for how to conveniently install SDL2 on Windows, [let me know](https://twitter.com/blacktm)! We're also exploring bundling SDL2 libs with R2D in future releases so all this nonsense won't be necessary.

## Installing Locally

Until a v0.1.0 release, this gem will only be available locally. To build and install, use:

```
$ rake build
```

This Rake task will conveniently build and install the gem locally and verbosely.

# Running the Examples

The [`examples/`](/examples) directory contains a variety of sample R2D applications. Examples are being used to test the gem while implementing the API and underlying engine.

# Running the Tests

Run tests using:

```
$ rake test
```

This gem uses `minitest`, but most tests are broken at the moment. Part of the challenge testing a graphics gem is that some tests can't be fully automated, e.g. Did that square draw correctly, or the audio sound right? For this reason, we're still trying to figure out a comprehensive testing strategy.

# Requirements and OS Support

R2D requires Ruby 2.0 or greater. Native extensions are used in this gem, so a compiler is needed. The intent is for R2D to be a fully cross-platform graphics environment and should run on OS X, Windows, and Linux.

The gem has been tested so far on:
- OS X 10.8.4 with SDL2 installed using [Homebrew](http://brew.sh)
<!-- - Windows 7 32-bit using the [RubyInstaller](http://rubyinstaller.org/) for Windows and the [MinGW DevKit](http://rubyinstaller.org/add-ons/devkit/) (required for building native extensions). -->

If you've tested R2D on other platforms or configurations, please [let me know](https://twitter.com/blacktm)! This thing should work everywhere.
