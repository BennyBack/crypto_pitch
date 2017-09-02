source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
gem 'rails', '~> 5.1.3'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.7'
gem 'dotenv-rails'
gem 'twilio-ruby'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'rails-erd'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bcrypt', '~> 3.1.7'
gem 'pry'
gem 'hirb'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'omniauth-facebook'
gem "therubyracer"
gem 'devise-bootstrap-views'
gem 'font-awesome-sass'
gem 'httparty'
gem "bootstrap", "~> 4.0.0.beta"
gem "figaro", "~> 1.1"
gem 'railties', '~> 5.0'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

# Added at 2017-08-25 12:41:45 -0400 by zannain:
gem "bootstrap", "~> 4.0.0.beta"

# Added at 2017-08-25 12:44:02 -0400 by zannain:
gem "jquery-rails", "~> 4.3"

gem "bootstrap-sass"

# Added at 2017-08-30 13:52:36 -0400 by zannain:
gem "faker", "~> 1.8"

# Added at 2017-09-01 19:33:43 -0400 by zannain:
gem "rails-controller-testing", "~> 1.0"

# Added at 2017-09-01 19:35:59 -0400 by zannain:
gem "nokogiri", "~> 1.8"
