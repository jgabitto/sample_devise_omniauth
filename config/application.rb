require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_mailbox/engine"
require "action_text/engine"
require "action_view/railtie"
require "action_cable/engine"
# require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module DeviseSignInOmni
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Only loads a smaller set of middleware suitable for API only apps.
    # Middleware like session, flash, cookies can be added back manually.
    # Skip views, helpers and assets when generating a new resource.
    config.api_only = true
    config.session_store :cookie_store
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore, config.session_options
    
    # config.middleware.use ActionDispatch::Flash
    # config.action_controller.per_form_csrf_tokens = false
    # config.action_controller.default_protect_from_forgery = true

    config.middleware.insert_before 0, Rack::Cors do
      allow do
        #Removed origins Array, changed syntax as documented: https://www.rubydoc.info/gems/rack-cors/0.4.0
        origins 'http://localhost:3001', 'http://localhost:3000', 'https://sample-devise-omniauth.netlify.app/'
        resource '*',
          headers: :any,
          expose: 'Authorization',
          methods: [:get, :post, :patch, :put, :delete, :options, :head],
          credentials: true       
      end
  end    
  end
end
