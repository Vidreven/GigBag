source 'https://rubygems.org'

# ruby '1.9.3'
gem 'rails', '3.2.11'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-spork'
  gem 'annotate', '>=2.5.0'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
end


group :production do
  gem 'pg'
  gem 'thin'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.0.3'

  gem 'compass-rails'
  gem 'zurb-foundation', '3.2.5'
end

gem 'jquery-rails'
gem 'select2-rails'
gem 'devise', '>= 2.2.2'
gem 'devise_invitable', '~> 1.1.0'
gem 'figaro'
gem 'lastfm'
gem 'simple_form'
gem 'ransack'
gem 'kaminari'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

#gem 'rspec-rails', :group => [:test, :development]

group :test do
  # Pretty printed test output
  gem 'simplecov', :require => false
  gem 'simplecov-rcov', :require => false
  gem 'turn', :require => false
  gem 'capybara'
  gem 'guard-rspec'
  gem 'faker'
  gem 'launchy'
  gem 'rb-inotify', '~> 0.8.8'
  gem 'cucumber-rails', '>= 1.3.0', :require => false
  gem 'database_cleaner', '>= 0.7.2'
  gem 'email_spec', '>= 1.4.0'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
