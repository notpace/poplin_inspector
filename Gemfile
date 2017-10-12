source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~>4.2.7.1'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Poplin Additions
# Mongo for our database
gem 'mongoid', '~> 5.0.0'
# Bunny to communicate with rabbitmq
gem 'bunny', '~> 2.6.4'
# We want non-digest versions of our assets for any font
gem 'non-stupid-digest-assets'
# Add some bootstrap
gem 'bootstrap', '~> 4.0.0.beta'

group :development, :test do
  # Rubocop for syntax checking and code cleanliness
  gem 'rubocop'
  # Call 'byebug' anywhere in the code to stop execution and get a debug console
  gem 'byebug'
  # Brakeman and bundle-audit for automated testing of security vulnerabilities
  gem 'brakeman', require: false
  gem 'bundler-audit'
  # Reset MongoDB after each test
  gem 'database_cleaner'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
