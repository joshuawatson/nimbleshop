# Encoding: UTF-8

version = File.read(File.expand_path("../../NIMBLESHOP_VERSION", __FILE__)).strip

Gem::Specification.new do |gem|

  gem.name        = 'nimbleshop_splitable'
  gem.version     = version
  gem.authors     = ['Neeraj Singh', 'megpha']
  gem.email       = ['neeraj@BigBinary.com']
  gem.homepage    = 'http://nimbleShop.org'

  gem.summary     = 'Splitable extension for Nimbleshop'
  gem.description = 'Provides Splitable support to nimbleShop'

  gem.files = Dir['{app,config,db,lib}/**/*'] + ['README.md']

  gem.test_files = Dir['test/**/*']
end
