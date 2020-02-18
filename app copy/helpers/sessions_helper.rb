# frozen_string_literal: true

module SessionsHelper
  # logs in the user
  def log_in(user)
    session[:user_id] = user.id
  end

  # Returns the current logged-in user (if any).
  def current_user
    if (user_id = session[:user_id])
      @current_user ||= User.find_by(id: user_id)
    elsif (user_id = cookies.signed[:user_id])
      user = User.find_by(id: user_id)
      if user&.authenticated?(cookies[:remember_token])
        log_in user
        @current_user = user
      end
    end
  end

  # Returns true if the the user is logged in, false if the user in logged out
  def logged_in?
    !current_user.nil?
  end

  # Forgets the stored session
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the user
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end

  # Remembers a user in a persistent session.
  def remember(user)
    cookies.permanent.signed[:user_id] = user.id
    cookies.permanent[:remember_token] = user.remember_token
  end
end
