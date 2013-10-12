# R2D: 2D Graphics for Ruby

R2D is a gem for drawing 2D graphics, animations, playing audio, capturing input, and more. It aims to be a simple and lightweight programmable graphics engine suitable for casual 2D games, visualizations, education, and more.

**WARNING: This gem is still under development!** This means the API and implementation are greatly in flux. To share ideas, ask questions, or discuss anything in general, check out the [Google group](https://groups.google.com/d/forum/r2d-gem). Tweet the author at [@blacktm](https://twitter.com/blacktm).

[View the R2D website](http://www.ruby2d.com) for more information about the gem and its documentation. *This site is also still under development.*

# Installing

Until a public release, this gem will only be available locally. Build and install using:

```
$ gem build r2d.gemspec
$ gem install r2d-0.0.0.gem --local
```

# Running the Examples

The [`examples/`](/examples) directory contains a wide variety of sample R2D applications. Please be aware _**the full API has not yet been implemented!**_ Examples are being used to test the gem while implementing the API and underlying engine.

# Requirements and OS Support

R2D requires Ruby 2.0 and greater. Native extensions are used in this gem, so a compiler is needed. The intention of R2D is to be a fully cross-platform graphics environment. The gem has so far been tested on OS X 10.8.4 and Windows 7 32-bit using the [RubyInstaller](http://rubyinstaller.org/) for Windows and the [MinGW DevKit](http://rubyinstaller.org/add-ons/devkit/) (required for building native extensions). If you've tested R2D on other platforms and configurations, please [let me know](https://twitter.com/blacktm) and open issues accordingly.
