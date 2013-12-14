class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    #user = AdminUser.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      sign_in_stu user
      $user_admin = @current_user_stu
      redirect_to user, :notice => "成功登录"
    else
      redirect_to signin_url, :notice => "email或password不正确"
    end

  end

  def destroy
    $user_admin = false
    sign_out_stu
    redirect_to root_url :notice => "成功登出"
  end

  #def failure
  #  redirect_to signin_url, :notice => "Authentication failed, please try again."
  #end
end
