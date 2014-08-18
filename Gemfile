source "https://rubygems.org"

ruby "2.1.2"

gem "airbrake"
gem "bourbon", "~> 3.2.1"
gem "coffee-rails"
gem "jquery-rails"
gem "neat", "~> 1.5.1"
gem "pg"
gem "rack-timeout"
gem "rails", "4.1.4"
gem "bower-rails"
gem "recipient_interceptor"
gem "sass-rails", "~> 4.0.3"
gem "uglifier"
gem "unicorn"
gem "rails-backbone"
gem "handlebars_assets"
gem "chosen-rails"

group :development do
  gem "foreman"
  gem "spring"
end

group :development, :test do
  gem "awesome_print"
  gem "dotenv-rails"
  gem "konacha"
  gem "poltergeist"
  gem "selenium-webdriver"
  gem "sinon-rails"
  gem "sinon-chai-rails"
  gem "guard-konacha"
  gem "guard"
end

group :test do
  gem "rspec-rails", "~> 3.0.0"
  gem "cucumber-rails"
  gem "capybara-webkit"
end

group :staging, :production do
  gem "newrelic_rpm", ">= 3.7.3"
end
