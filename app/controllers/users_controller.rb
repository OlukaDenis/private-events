# frozen_string_literal: true

class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to @user
    else
      flash[:danger] = 'Failed to create an event'
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
    @my_events = @user.creator_events.paginate(page: params[:page])
    @attended_events = @user.attended_events.paginate(page: params[:page])
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
