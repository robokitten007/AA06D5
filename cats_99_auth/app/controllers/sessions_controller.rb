class SessionsController < ApplicationController
  before_action: :require_logged_in, only: [:destroy] 
  def new
    render :new
  end

  def create #log-in
    @user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )

    if @user
      login_user!
      redirect_to cats_url
    else
      render :new
    end
  end

  def destroy #logout
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    @current_user = nil

  end
end