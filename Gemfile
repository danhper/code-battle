source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '3.2.14'

group :production do
  gem 'pg'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'uglifier', '>= 1.0.3'

  gem 'jquery-rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', '~> 2.0', require: false
  gem 'rack-insight'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'childprocess'
  gem 'spork'
end
