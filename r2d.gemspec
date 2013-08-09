$:.push File.expand_path('../lib', __FILE__)
require 'r2d/version'

Gem::Specification.new do |s|
  s.name        = 'r2d'
  s.version     = R2D::VERSION
  s.date        = '2013-04-06'
  s.author      = 'Tom Black'
  s.email       = '@blacktm'
  s.summary     = 'R2D'
  s.description = 'A Ruby 2D graphics interface.'
  s.homepage    = 'https://github.com/blacktm/r2d'
  s.license     = 'MIT'
  s.files       = Dir.glob('lib/**/*') +
                  Dir.glob('ext/**/*.{a,c,dll,h,rb}')
  s.required_ruby_version = '>= 2.0.0'
  s.executables          << 'r2d'
  s.extensions            = ['ext/r2d/extconf.rb']
end
