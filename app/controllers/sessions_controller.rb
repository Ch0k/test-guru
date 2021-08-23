class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      @url = cookies[:user_url]
      redirect_to @url
    else
      flash.now[:alert] = 'Are you Guru? Verify your email or password!'
      render :new
    end
  end

  def reset
    reset_session
    #session.delete(:user_id)
    redirect_to root_path
  end
end
