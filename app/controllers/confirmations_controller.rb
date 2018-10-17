class ConfirmationsController  < Devise::ConfirmationsController

# def show
#     self.resource = resource_class.confirm_by_token(params[:confirmation_token])

#     if resource.errors.empty?
#       set_flash_message(:notice, :confirmed) if is_navigational_format?
#       sign_in(resource_name, resource)
#       respond_with_navigational(resource){ redirect_to root_path }
#     else
#       respond_with_navigational(resource.errors, status: :unprocessable_entity){ render_to_string :new }
#     end
#   end

private
   def after_confirmation_path_for(resource_name,resource)
      sign_in(resource)
      root_path
   end
end
