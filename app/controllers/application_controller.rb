class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

 def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  def post_owner
    @post = Post.find(params[:id])
    if current_user.acct_type == 'individual' && current_user.id == @post.user_id
      @post = current_user.posts.find(params[:id])
    else
      redirect_to root_path
      flash[:notice] = 'You do not have permissions to view this post'
    end
  end
end