class ApplicationController < ActionController::Base
  before_action :get_user

  def get_user
    @current_user = User.find_by(token: session[:user_auth]) if session[:user_auth]
  end

  def handle_not_found
    render :file => "#{Rails.root}/public/404.html", :status => 404
  end
end
