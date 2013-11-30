# R2D: 2D Graphics for Ruby

R2D is a gem for drawing 2D graphics, animations, playing audio, capturing input, and more. It aims to be a simple and lightweight programmable graphics engine suitable for casual 2D games, visualizations, education, and more.

**WARNING: This gem is still in development!** This means the API and implementation are very much in flux. Review the latest API [documentation](http://www.ruby2d.com/docs) and the [change log](http://www.ruby2d.com/docs/history.html) for more info.

[View the R2D website](http://www.ruby2d.com) for news and updates (*this site is also still in development*). To share ideas, ask questions, or discuss anything in general, check out the [Google group](https://groups.google.com/d/forum/r2d-gem). Tweet me (the author) at [@blacktm](https://twitter.com/blacktm).

# Installing

Until a v0.1.0 public release, this gem will only be available locally. To build and install, use:

```
$ rake build
```

This Rake task will build and install the gem locally and verbosely.

## Installing on OS X

This gem requires [Homebrew](http://brew.sh) on OS X to install [SDL2](http://www.libsdl.org). If you prefer not to install Homebrew and already have SDL2 available on your `$PATH`, use the `--use-system-libs` option:

```
$ gem install r2d -- --use-system-libs
```

This option will search for SDL2 libs using `-lSDL2` style arguments. The [`extconf.rb`](/ext/r2d/extconf.rb) will check to make sure libs are available during the `gem install` process.

## Installing on Windows and Linux

This gem cannot (yet) be installed on Windows and Linux with ease, but we're working on it! If you have an idea for how to conveniently install SDL2 on Windows, [let me know](https://twitter.com/blacktm)!

# Running the Examples

The [`examples/`](/examples) directory contains a variety of sample R2D applications. These examples are being used to test the gem while implementing the API and underlying engine.

# Running the Tests

Run tests using:

```
$ rake test
```

This gem uses `minitest`, but most tests are broken at the moment. Part of the challenge of testing a graphics gem is that some tests can't be fully automated, e.g. did that square draw correctly, or the audio sound right? For this reason, we're still trying to figure out a comprehensive testing strategy.

# Requirements and OS Support

R2D requires Ruby 2.0 or greater. Native extensions are used in this gem, so a compiler is needed. The intent is for R2D to be a fully cross-platform graphics environment and should run on OS X, Windows, and Linux.

So far, the gem has been tested on:

| OS        | Ruby       | Env         | SDL2             |
| --------- | ---------- | ----------- | ---------------- |
| OS X 10.9 | 2.0.0-p353 | rbenv 0.4.0 | 2.0.1 / Homebrew |

<!-- - Windows 7 32-bit using the [RubyInstaller](http://rubyinstaller.org/) for Windows and the [MinGW DevKit](http://rubyinstaller.org/add-ons/devkit/) (required for building native extensions). -->

If you've tested R2D on other platforms or configurations, please [let me know](https://twitter.com/blacktm)! This thing should work everywhere.
