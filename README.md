First time creating an app

	- rails new PROJECT_NAME --database=postgresql
	- remove from config `boot.rb`  `require 'bootsnap/setup' # Speed up boot time by caching expensive operations.`
	- insert gems
		

		source 'https://rubygems.org'

		ruby '2.5.1'

		gem 'devise'
		gem 'rails', '~> 5.2.0'
		gem 'pg', '>= 0.18', '< 2.0'
		gem 'puma', '~> 3.11'
		gem 'sass-rails', '~> 5.0'

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

	- run bundle
	- rails db:create

