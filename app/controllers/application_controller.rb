class ApplicationController < ActionController::Base
	# rescue_from User::NotAuthorized, :with => :user_not_authorized

protect_from_forgery with: :exception

before_action :configure_permitted_parameters, if: :devise_controller?
 protected
   def configure_permitted_parameters
       devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:email, :password, :password_confirmation,:remember_me,:oraganization_id,:name,:phnumber,:gender)}
       devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:email, :password, :current_password,:password_confirmation,:remember_me,:oraganization_id,:name,:phnumber,:gender)}
    end


# private

# def user_not_authorized
#     flash[:error] = "If you want to access that account then You have to logged in"
#     redirect_to :back
#   end

# def authenticate_admin!
#   if current_user && current_user.is_admin
#     # fine
#   else
#     redirect_to new_user_session_path
#   end
# end
end
