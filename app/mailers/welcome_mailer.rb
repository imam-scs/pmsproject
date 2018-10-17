class WelcomeMailer < ApplicationMailer



	def welcome_send(user)

	 @user = user
	 mail to: user.email,subject: "welcome to my PMS Project",from:'imam.sykamcs@gmail.com'
	end

end
