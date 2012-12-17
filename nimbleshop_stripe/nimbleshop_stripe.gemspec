# Encoding: UTF-8

version = '0.0.17.beta'

Gem::Specification.new do |gem|

  gem.name        = 'nimbleshop_stripe'
  gem.version     = version
  gem.authors     = ['Neeraj Singh', 'megpha']
  gem.email       = ['neeraj@BigBinary.com']
  gem.homepage    = 'http://nimbleShop.org'

  gem.summary     = 'Stripe extension for nimbleShop'
  gem.description = 'Provides stripe support to nimbleShop'

  gem.files = Dir['{app,config,db,lib}/**/*'] + ['README.md']

  gem.test_files = Dir['test/**/*']

  gem.add_dependency 'stripe'
end
