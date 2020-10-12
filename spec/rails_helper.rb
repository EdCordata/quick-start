require 'spec_helper'
require 'factory_bot'

# Rails default locales: https://github.com/svenfuchs/rails-i18n/blob/master/rails/locale/en.yml
# Shoulda Matchers: https://github.com/thoughtbot/shoulda-matchers#matchers

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)

# Prevent database truncation if the environment is production
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'rspec/rails'

# Coverage report
require 'simplecov'
SimpleCov.start

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.fixture_path               = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  Dir[Rails.root.join("spec/support/**/*.rb")].each { |f| require(f) }

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!
end