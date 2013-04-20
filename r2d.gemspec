Gem::Specification.new do |s|
  s.name        = 'r2d'
  s.version     = '0.0.0'
  s.date        = '2013-04-06'
  s.summary     = 'R2D'
  s.description = 'A Ruby 2D graphics interface.'
  s.license     = 'MIT'
  s.author      = 'Tom Black'
  s.email       = '@blacktm'
  s.homepage    = 'https://github.com/blacktm/r2d'
  s.files       = Dir.glob('lib/**/*')
  s.add_dependency 'gosu', '~> 0.7.47.1'
end
