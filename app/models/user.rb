class User < ApplicationRecord
  # after_update :send_password_change_email, if: :needs_password_change_email?
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable,
        :recoverable, :rememberable,:trackable, :timeoutable,:validatable




protected
  def confirmation_required?
   true
  end


after_create :welcome_send
def welcome_send
WelcomeMailer.welcome_send(self).deliver
# redirect_to root_path, alert:"Thank you for the registration"
end

# private
# def needs_password_change_email?
#     encrypted_password_changed? && persisted?
#   end
   
#   def send_password_change_email
#     UserMailer.password_changed(id).deliver
#   end

after_update :send_password_reset_email
def send_password_reset_email
    UserMailer.password_changed(id).deliver_now
  end

end
