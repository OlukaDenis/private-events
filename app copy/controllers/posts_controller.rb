# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :logged_in_user, only: %i[create new]
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to root_url
  end

  def index
    @posts = Post.all
  end

  private

  # Confirms the logged in user
  def logged_in_user
    redirect_to login_url unless logged_in?
    # flash[:danger] = 'Please log in to continue!'
  end

  def post_params
    params.require(:post).permit(:body, :title)
  end
end
