class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      user.update(token: SecureRandom.urlsafe_base64(64, true))
      session[:user_auth] = user.token
      flash[:success] = "You have successfully logged in."
      redirect_to home_path
    else
      flash.now[:error] = "Invalid email/password combination."
      render :new
    end
  end

  def destroy
    get_user
    session[:user_auth] = nil
    @current_user.update(token: nil)
    @current_user = nil
    flash[:success] = "You have successfully logged out."
    redirect_to home_path
  end
end