class SessionsController < ApplicationController
  def new
    
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user
      log_in user
      redirect_to user_path(user)
    else
      flash.now[:danger] = "Invalid username"
      render 'new'
    end
  end
end
