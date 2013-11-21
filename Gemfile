source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '4.0.0'

gem 'devise'
gem 'omniauth'
gem 'omniauth-github'
gem 'seedbank', github: 'james2m/seedbank'
gem 'pygments.rb'
gem 'will_paginate', '~> 3.0'
gem 'gravatar_image_tag'

gem 'coveralls', require: false

group :production, :test do
  gem 'pg'
end

gem 'jquery-rails'
gem 'backbone-on-rails'
gem 'underscore-string-rails'
gem 'turbolinks'
gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'
gem 'less-rails-bootstrap'
gem 'sass-rails',   '~> 4.0.0'
gem 'less-rails'
gem 'therubyracer'
gem 'coffee-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'i18n-js'
gem 'handlebars_assets'

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'guard-livereload', '~> 2.0', require: false
  gem 'annotate'
end

group :test do
  gem 'rspec-rails', '~> 2.0'
  gem 'rspec-expectations'
  gem 'guard-spork'
  gem 'guard-rspec'
  gem 'spork-rails', :github => 'sporkrb/spork-rails'
  gem 'database_cleaner'
end

group :development, :test do
  gem 'childprocess'
  gem 'factory_girl_rails'
  gem 'jazz_hands'
  gem "rb-readline", "~> 0.5.0", require: false
  gem 'faker'
end
