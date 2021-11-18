class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.token = SecureRandom.urlsafe_base64(64, true)
    if @user.save
      session[:user_auth] = @user.token
      flash[:success] = "You have successfully signed up."
      redirect_to home_path
    else
      flash[:error] = @user.errors.full_messages.join(", ")
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end