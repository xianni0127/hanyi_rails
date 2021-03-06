require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FisrtRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.action_mailer.default_url_options = {host:'http://www.sina.com'}
    config.active_job.queue_adapter = :sidekiq
    config.action_controller.permit_all_parameters = true
    # config.active_job.queue_name_prefix = Rails.env
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = :de
    config.i18n.available_locales=[:en, :pt,:de, :pl, :en_PR]
  end
end
#
# FastGettext.add_text_domain 'app', :path => 'locale', :type => :po
# FastGettext.default_text_domain = 'app'
# FastGettext.default_available_locales = ['en','en_PR','de','pl']
# FastGettext.default_locale = 'de'
