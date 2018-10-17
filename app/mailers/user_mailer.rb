class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_changed.subject
  #
  # def password_changed
  #   @greeting = "Hi"

  #   mail to: "to@example.org"
  # end



  def password_changed(id)
    @user = User.find(id)
    mail to: @user.email, subject: "Your password has changed", from: 'imam.sykamcs@gmail.com'
  end
end
