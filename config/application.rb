require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Kiipet
  class Application < Rails::Application
  config.action_dispatch.default_headers = {
    'Access-Control-Allow-Origin' => 'http://d26n7qwq5qwjss.cloudfront.net',
    'Access-Control-Request-Method' => %w{GET POST OPTIONS}.join(",")
    }


    config.middleware.insert_before ActionDispatch::Static, Rack::Cors do
     allow do
       origins ''
       resource '',
       headers: :any,
       methods: [:get, :options]
     end
   end
   #…
     config.assets.paths << Rails.root.join("app", "assets")
     config.assets.precompile += %w( .svg .eot .woff .ttf )
     config.assets.header_rules = {
       :global => {'Cache-Control' => 'public, max-age=31536000'},
       :fonts  => {'Access-Control-Allow-Origin' => '*'}
     }
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Default is UTC.
    # config.time_zone = 'Central Time (US & Canada)'
    # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
    # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    # config.i18n.default_locale = :de
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**/*.{rb,yml}').to_s]
    config.i18n.default_locale = :es

    # Do not swallow errors in after_commit/after_rollback callbacks.
    config.active_record.raise_in_transactional_callbacks = true
  end
end
