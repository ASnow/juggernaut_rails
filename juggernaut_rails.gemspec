version = File.read(File.expand_path("../VERSION",__FILE__)).strip

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'juggernaut_rails'
  s.version     = version
  s.summary     = 'A push server written in Ruby with Rails integration.'
  s.description = '.'

  s.required_ruby_version     = '>= 1.9.3'
  s.required_rubygems_version = ">= 1.8.11"
  s.license     = 'MIT'

  s.author   = 'Alex MacCaw, asnow'
  s.email    = ''
  s.homepage = 'https://github.com/ASnow/juggernaut_rails'

  s.bindir      = 'bin'
  s.executables = []
  s.files       = Dir['[A-Z]*', '{bin,lib,media,rails,test}/**/*']

  s.add_dependency('eventmachine',    '>= 0.10.0')
  s.add_dependency('json',            '>= 1.1.2')
  s.add_dependency('escape',          '~> 1.0')
end