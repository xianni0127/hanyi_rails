class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_gettext_locale
end
