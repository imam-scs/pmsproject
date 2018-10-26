class ApplicationController < ActionController::Base
	

protect_from_forgery with: :exception
before_action :configure_permitted_parameters, if: :devise_controller?
 protected
   def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,:remember_me,:oraganization_id)}
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password,:password_confirmation,:remember_me,:oraganization_id)}
    end



def authenticate_admin!
  if current_user && current_user.is_admin
    # fine
  else
    redirect_to new_user_session_path
  end
end
end
