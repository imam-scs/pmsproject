class SessionsController < Devise::SessionsController

 def create
    return redirect_to new_user_session_path unless user_exist?
    user = User.find_by(id: session[:temp_user_id])

    puts"============="
    puts user
    puts"============="
    return render :otp  if user.otp_required_for_login
    create_session(user)
  end

  def user_exist?
    return false unless user = User.find_by(email: params[:user][:email])
    return false unless user.valid_password?(params[:user][:password])
    session[:temp_user_id] = user.id
    true
  end

  def verify_otp
    
    user = User.find_by(id: session[:temp_user_id])

      
      puts user.otp_secret.inspect
      puts params[:otp_attempt].inspect
      puts "==========="
    
    if user.validate_and_consume_otp!(params[:otp_attempt], otp_secret: user.otp_secret)
     puts "Create Sessions"
     create_session(user)
    else
      puts "Else Condition"
      render :otp
    end
  end

  def create_session(user)
    sign_in(user)
    puts "========="

    puts session
    puts user
    puts "========="
    session.delete(:temp_user_id)
    respond_with user, location: after_sign_in_path_for(user)
  end

 # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end


def session_params
    params.require(:user).permit(:email, :password, :remember_me, :otp_attempt)
  end


end