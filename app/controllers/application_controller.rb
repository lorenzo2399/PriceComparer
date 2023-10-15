class ApplicationController < ActionController::Base
 before_action :set_locale

	
	  
	before_action :configure_permitted_parameters,
		if: :devise_controller?
		
		protected
		
		def configure_permitted_parameters
			devise_parameter_sanitizer.permit(:sign_up, keys: [:full_name])
			devise_parameter_sanitizer.permit(:account_update, keys: [:avatar])
		end
		
		
def set_locale
	I18n.locale=session[:select_l] || I18n.default_locale
end

end
