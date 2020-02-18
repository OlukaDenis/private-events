class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to root_url
    else
      flash.now[:danger] = "Invalid username"
      render 'new'
    end
  end

  def destroy
    signout if logged_in?
    flash.now[:warning] = 'You have signed out!'
    redirect_to root_url
  end
end
