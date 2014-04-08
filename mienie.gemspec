# encoding: utf-8

require File.expand_path('../lib/mienie/version', __FILE__)

Gem::Specification.new do |gem|
  gem.name        = 'mienie'
  gem.version     = Mienie::VERSION
  gem.authors     = [ 'Arne Brasseur' ]
  gem.email       = [ 'arne@arnebrasseur.net' ]
  gem.description = 'Full screen visual menu for Makey Makey'
  gem.summary     = gem.description
  gem.homepage    = 'https://github.com/plexus/mienie'
  gem.license     = 'GPL-2'

  gem.require_paths    = %w[lib]
  gem.files            = `git ls-files`.split($/)
  gem.test_files       = `git ls-files -- spec`.split($/)
  gem.extra_rdoc_files = %w[README.md]

  gem.add_runtime_dependency 'gosu'
  gem.add_runtime_dependency 'bloopsaphone'
end
