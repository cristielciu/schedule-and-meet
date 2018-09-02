source 'https://rubygems.org'

ruby '2.5.1'

gem 'devise'
gem 'rails', '~> 5.2.0'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'bootstrap', '~> 4.1.3'
gem 'sprockets-rails', '~> 3.0', '>= 3.0.4'
gem 'jquery-rails', '~> 4.3', '>= 4.3.3'
gem 'figaro', '~> 1.1', '>= 1.1.1'

group :production do
  gem 'uglifier', '~> 2.7', '>= 2.7.2'
end

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'annotate'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'pry-rails'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15', '< 4.0'
  gem 'selenium-webdriver'
  gem 'chromedriver-helper'
end