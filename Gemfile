source 'https://rubygems.org'

git_source(:github) { |repo| "https://github.com/#{repo}.git" }

gem 'rails', '6.0.3.3'

# DB
gem 'sqlite3', '1.4.2'

# Server
gem 'puma', '4.3.5'

# Assets Requirements
gem 'jquery-turbolinks', '2.1.0'
gem 'underscore-rails', '1.8.3'
gem 'jquery-rails', '4.4.0'
gem 'sassc-rails', '2.1.2' #  C implementation of Sass
gem 'turbolinks', '5.2.1'
gem 'mini_racer', '0.3.1', platforms: :ruby
gem 'gon', '6.3.2'

# Assets
gem 'font-awesome-rails', '4.7.0.5'
gem 'momentjs-rails', '2.20.1'
gem 'bootstrap', '4.5.2'

# Views
gem 'bootstrap4-kaminari-views', '1.0.1'
gem 'dependent-fields-rails', '0.4.2'
gem 'nested_form_fields', '0.8.4'
gem 'simple_form', '5.0.2'
gem 'kaminari', '1.2.1'
gem 'ransack', '2.3.2'
gem 'haml', '5.1.2'

# Globalize
gem 'globalize', '6.0.0.alpha.1', github: 'globalize/globalize'
gem 'enumerize', '2.3.1'
gem 'rails-i18n', '6.0.0'
gem 'globalize-accessors', '0.1.5'
gem 'globalize-validations', '0.0.4'

# Permissions
gem 'aasm'
gem 'cancancan'

# Misc
gem 'foreman', '0.87.2'
gem 'config', '2.2.1'
gem 'faker', '2.13.0'
gem 'bcrypt', '3.1.16'


group :development do
  gem 'activerecord_sane_schema_dumper', '0.0.1' # So scheme changes can be normally viewed in git diff

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring', '2.1.1'
  gem 'spring-watcher-listen', '2.0.1'

  # Better Errors
  gem 'better_errors', '2.7.1'
  gem 'binding_of_caller', '0.8.0'
end

group :test do

  # rspec
  gem 'rspec-rails', '3.9.1'

  # Rspec extras
  gem 'simplecov', '0.19.0'
  gem 'shoulda-matchers', '4.4.1'
  gem 'factory_bot_rails', '6.1.0'
end

group :development, :test do
  gem 'pry', '0.13.1'
end
