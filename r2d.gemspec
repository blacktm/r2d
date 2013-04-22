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
  s.files       = Dir.glob('lib/**/*')
  s.add_dependency 'gosu', '~> 0.7.47.1'
end
