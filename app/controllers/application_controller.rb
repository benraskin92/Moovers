class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

#Defines what a logged in user is
#Determines which pages require a user to be logged in
 def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

#***** COME BACK *****#
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

#Defines what an owner's post is
#Like logged_in_user, certain pages such as edit require the owner's post
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