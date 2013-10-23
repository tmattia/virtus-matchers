# encoding: utf-8

$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)

require 'virtus-matchers'

Gem::Specification.new do |s|
  s.name = 'virtus-matchers'
  s.version = Virtus::Matchers::VERSION.dup
  s.summary = 'RSpec matchers for Virtus'
  s.description = 'RSpec matchers for Virtus'
  s.homepage = 'https://github.com/tmattia/virtus-matchers'

  s.authors = ['Tomas Mattia']
  s.email = 'tomas.mattia@gmail.com'

  s.files = Dir.glob('lib/**/*.rb')
  s.test_files = Dir.glob('spec/**/*.rb')

  s.require_paths = ['lib']

  s.add_dependency 'virtus', '~> 1.0.0'

  s.add_development_dependency 'rake'
  s.add_development_dependency 'bundler'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'guard-rspec'
  s.add_development_dependency 'rb-fsevent'
end
