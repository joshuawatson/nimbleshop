source 'https://rubygems.org'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.2'
  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'sqlite3'
gem 'debugger'

group :test do
  gem 'guard-minitest'
  gem 'guard', '= 1.0.3'
  gem 'capybara', '= 1.1.3'
  gem 'selenium-webdriver', '~> 2.21'
  gem 'database_cleaner', '~> 0.9.1'
  gem 'factory_girl_rails', '~> 4.1.0'
  gem 'launchy'

  gem 'mocha', '~> 0.12.1', require: false

  # for fake data in testing
  gem 'faker', '~> 1.1.2'

  # to gather response from payment gateways like Authorize.net
  gem 'vcr', '~> 2.3.0'

  # vcr uses webmock
  gem 'webmock', '~> 1.8.0'
end
