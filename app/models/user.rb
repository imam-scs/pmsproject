class User < ApplicationRecord
  devise :two_factor_authenticatable,
         :otp_secret_encryption_key => '9e61e42e77c5948cb4288f08e1f1b154d2eaafc5e3b2bbed8fb49875c8974b4cbd3728a62fa874a1f7969d9847883405662362d17e9472f1ab8bcef61a41e986'
         # ENV['TWO_FACTOR_SECRET_KEY_NAME']


belongs_to :organization , required: false
# accepts_nested_attributes_for :organization
# validates :email, presence: true, uniqueness: {scope: :oraganization_id}
 has_many :projects
 after_update :send_password_change_email, if: :needs_password_change_email?

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :registerable, :confirmable,
        :recoverable, :rememberable,:trackable, :timeoutable,:validatable,:lockable
# validates_confirmation_of :password
#  validates_presence_of     :password, if: :password_required?
        validates_confirmation_of :password, if: :password_required?
#           validates_length_of       :password, within: password_length, allow_blank: true

validates_presence_of   :email, if: :email_required?


number_regex = /\d[0-9]\)*\z/;
validates_presence_of :name, :message =>"Enter a Full Name"
validates_format_of :phnumber, :with =>  number_regex,:length => { :minimum => 10, :maximum => 15}, :message => "Only positive number without spaces are allowed"
# validates :password, presence: true, confirmation: true, length: { minimum: 8 }
# validates_inclusion_of  :gender,   
#                         :in => %w( male, female)
 def password_required?
  !persisted? || !password.nil? || !password_confirmation.nil?
 end

 def email_required?
   true
 end
def activate_otp
    self.otp_required_for_login = true
    puts "==============="
    puts unconfirmed_otp_secret
    puts "==============="
    self.otp_secret = unconfirmed_otp_secret


    self.unconfirmed_otp_secret = nil
    save!
  end

  def deactivate_otp
    self.otp_required_for_login = false
    self.otp_secret = nil
    save!
  end

  


def remember_me
    true
  end

protected
  def confirmation_required?
   true
  end


after_create :welcome_send
def welcome_send
WelcomeMailer.welcome_send(self).deliver
# redirect_to root_path, alert:"Thank you for the registration"
end

private
def needs_password_change_email?
    encrypted_password_changed? && persisted?
  end
   
  def send_password_change_email
    UserMailer.password_changed(id).deliver
 end



# after_update :send_password_reset_email
# def send_password_reset_email
# 	UserMailer.password_changed(id).deliver
#   end

#  after_update :send_password_reset_email
# def send_password_reset_email
# user = User.find_by_id(id)
# unless user.blank?
      # if user.update_attributes(user.password.to_h)//update_with_password
#         UserMailer.password_changed(user).deliver
#       else
#         render :action => 'edit'
#       end
#  else
#       render :action => 'edit'
#   end
# end



# Email changed
# after_create :account_created

# # called after the account is first created
# def account_created

#   # check if this activiy has already been created
#   if !self.activities.where(:kind => "created_account").blank?
#     puts "WARNING: user ##{self.id} already has a created account activity!"
#     return
#   end

#   # update points
#   self.points += 50
#   self.save

#   # create activity
#   act = self.activities.new
#   act.kind = "created_account"
#   act.created_at = self.created_at
#   act.save

# end


# def confirm!
#   super
#   account_created
# end


end
