source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'jquery-rails'
gem 'turbolinks'

gem 'devise'
gem 'omniauth'
gem 'omniauth-github'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :assets do
  gem 'sass-rails',   '~> 4.0.0'
  gem 'coffee-rails', '~> 4.0.0'
  gem 'uglifier', '>= 1.3.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', '~> 2.0', require: false
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'childprocess'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
end
