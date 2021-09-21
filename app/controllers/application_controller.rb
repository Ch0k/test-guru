class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_locale
  
  def after_sign_in_path_for(resource)
    if resource.admin?
      admin_tests_path
    else
      root_path
    end
  end

  def default_url_options(options ={})
    I18n.default_locale == I18n.locale ? {} : { lang: I18n.locale }
  end

  protected
    
  def configure_permitted_parameters
    added_attrs = %i[email password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang])? params[:lang] : I18n.default_locale
  end
end
