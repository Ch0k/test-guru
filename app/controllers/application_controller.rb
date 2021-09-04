class ApplicationController < ActionController::Base
  before_action :set_locale
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      root_path
    end
  end

  def default_url_options(options ={})
  if I18n.default_locale == I18n.locale
    options ={}
  else
    { lang: I18n.locale }
  end
end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang])? params[:lang] : I18n.default_locale
  end
end
