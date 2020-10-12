require_relative 'boot'

require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
# require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
require 'rails/test_unit/railtie'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module QuickStart
  class Application < Rails::Application
    config.load_defaults 6.0


    config.generators do |g|
      g.orm            :active_record # Use ActiveRecord model generator
      g.test_framework :rspec         # Use rspec as default test framework
    end

    # Associations required
    config.active_record.belongs_to_required_by_default = true

    # Mailer
    uri                                                 = URI(Settings['overall']['url'])
    config.action_mailer.default_options                = { from: Settings['mailer']['default_from'] }
    Rails.application.routes.default_url_options[:host] = uri.host
    Rails.application.routes.default_url_options[:port] = uri.port

    # Locales
    require 'i18n/backend/fallbacks'
    config.i18n.enforce_available_locales = true
    config.i18n.fallbacks                 = JSON.parse(Settings['locales']['fallbacks'].to_json, symbolize_names: true)
    config.i18n.load_path                 = Dir["#{Rails.root}/config/locales/**/*.yml"]
    config.i18n.default_locale            = Settings['locales']['default']
    config.i18n.available_locales         = Settings['locales']['available']

    # Assets
    config.assets.precompile += %w( .svg .eot .woff .woff2 .ttf )
    config.assets.paths << "#{Rails.root}/vendor/"

    # Timezone
    config.time_zone                                = Settings['overall']['timezone']
    config.active_record.default_timezone           = :utc
    config.active_record.time_zone_aware_attributes = true

    # load models from sub-folders (without namespacing)
    config.autoload_paths += Dir["#{Rails.root}/app/models/association_tables"]
    config.autoload_paths += Dir["#{Rails.root}/app/models/conjunction_models"]
    config.autoload_paths += Dir["#{Rails.root}/app/models/validations"]
    config.autoload_paths += Dir["#{Rails.root}/app/models/system"]

    # Load lib's
    Dir["#{Rails.root}/lib/**/*.rb"].each { |f| require(f) }

  end
end
