source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'devise'
gem 'omniauth'
gem 'omniauth-github'

gem 'seedbank', github: 'james2m/seedbank'

gem 'pygments.rb'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end


gem 'jquery-rails'
gem 'backbone-on-rails'
gem 'turbolinks'
gem 'anjlab-bootstrap-rails', :require => 'bootstrap-rails',
                              :github => 'anjlab/bootstrap-rails',
                              :branch => '3.0.0'
gem 'sass-rails',   '~> 4.0.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'guard-livereload', '~> 2.0', require: false
  gem 'annotate'
end

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails', '~> 2.0'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'childprocess'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
end
