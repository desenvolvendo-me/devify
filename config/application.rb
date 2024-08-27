require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Devify
  class Application < Rails::Application
    config.generators do |g|
      g.template_engine :railsui
      g.fallbacks[:railsui] = :erb
    end

    config.to_prepare do
      Devise::Mailer.layout "mailer"
    end

    # Config default time to Brasília for lesson launch_time
    config.time_zone = 'Brasilia'

    config.active_job.queue_adapter = :sidekiq

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Specify location below
    config.i18n.default_locale = 'pt-BR'
    config.i18n.locale = 'pt-BR'

    # Add custom autoload paths
    config.autoload_paths += %W(#{config.root}/lib)
    config.autoload_paths += %W(#{config.root}/app/businesses/gateways)

    # Eager load paths if needed
    config.eager_load_paths += %W(#{config.root}/app/businesses/gateways)

    # Configuration for the application, engines, and railties goes here.
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*',
                 headers: :any,
                 methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  end
end
