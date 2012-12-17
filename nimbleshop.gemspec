# Encoding: UTF-8

require 'nimbleshop/version'
version = Nimbleshop::Version.to_s
version = '0.0.17.beta'
rails_version = Nimbleshop::RailsVersion.to_s

Gem::Specification.new do |gem|
  gem.platform          = Gem::Platform::RUBY
  gem.name              = 'nimbleshop'
  gem.version           = version
  gem.authors           = ['Neeraj Singh', 'megpha']
  gem.email             = 'neeraj@BigBinary.com'
  gem.homepage          = 'http://nimbleShop.org'

  gem.summary           = 'nimbleShop gem is a free and open source e-commerce framework based on ruby on rails'
  gem.description       = 'nimbleShop is a free and open source e-commerce framework based on ruby on rails'

  gem.files = Dir['{lib}/**/*'] + ['README.md']
  gem.require_path = 'lib'
  gem.requirements << 'none'
  gem.required_ruby_version     = '>= 1.9.2'
  gem.required_rubygems_version = ">= 1.3.6"

  gem.add_dependency 'rails', rails_version

  gem.add_dependency 'nimbleshop_core',            version

  gem.add_dependency 'nimbleshop_authorizedotnet', version
  gem.add_dependency 'nimbleshop_paypalwp',        version
  gem.add_dependency 'nimbleshop_splitable',       version
  gem.add_dependency 'nimbleshop_cod',             version
  gem.add_dependency 'nimbleshop_stripe',          version
end
