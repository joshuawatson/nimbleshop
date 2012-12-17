# Encoding: UTF-8

version = '0.0.17.beta'

Gem::Specification.new do |gem|

  gem.name        = 'nimbleshop_paypalwp'
  gem.version     = version
  gem.authors     = ['Neeraj Singh', 'megpha']
  gem.email       = ['neeraj@bigbinary.com']
  gem.homepage    = 'http://nimbleShop.org'

  gem.summary     = 'Paypal WPS extension for nimbleshop'
  gem.description = 'Provides Paypal web payments standard support to nimbleshop'

  gem.files = Dir["{app,config,db,lib}/**/*"] + ['README.md']

  gem.test_files = Dir['test/**/*']

  gem.add_dependency 'valid_email'
  gem.add_dependency 'money'
end
