class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    debugger
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user.nil?
      render :new
    else 
      #need to log in user
      session[:session_token] = user.reset_session_token!
      redirect_to cats_url
    end
  end

end
