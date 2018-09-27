class ApplicationController < ActionController::Base
	before_action :exit_banned
	before_action :authenticate_user!, except: [:index, :show]
	before_action :set_locale
	before_action :configure_permitted_parameters, if: :devise_controller?
	add_flash_types :success, :danger, :info, :warning
	  

	protected

	def configure_permitted_parameters
	  added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
	  devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
	  devise_parameter_sanitizer.permit :account_update, keys: added_attrs
	end
	
	def set_locale 
		I18n.locale = params[:locale] || I18n.default_locale
	end

	def default_url_options(options = {})
		{locale: I18n.locale}.merge options
	end

	def exit_banned
	  if current_user.present? && current_user.blocked?
	    sign_out current_user
	    flash[:danger] = "You are banned on this site."
	    root_path
	  end
	end
  
end
