require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module OwnerHelper
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    SERVICE_NAME = "iRent"
    TRANSLATION_API_KEY = "AIzaSyAdNa3-bcmLEgFxbdDRgRaLD0cCd5WH5rI"
    TRANSLATION_PROJECT_ID = "plasma-figure-231914"
    
    config.i18n.available_locales = %i(ja en)
    config.i18n.enforce_available_locales = true
    config.i18n.default_locale = :ja
  end
end
