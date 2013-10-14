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

group :production do
  gem 'pg'
  gem 'rails_12factor'
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
  gem 'better_errors'
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
