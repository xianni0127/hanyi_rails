class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :set_gettext_locale
  before_action :set_locale

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def extract_locale_from_tld
    parsed_locale = request.host.split('.').last
    I18n.available_locales.map(&:to_s).include?(parsed_locale)? parsed_locale:nil
  end

  def extract_locale_from_subdomain
    parsed_locale =request.subdomains.first
    I18n.available_locales.map(&:to_s).include?(parsed_locale)? parsed_locale:nil
  end

  def default_url_options
    {locale:I18n.locale}
  end
end
