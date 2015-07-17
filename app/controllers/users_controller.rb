class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  before_action :correct_user,   only: [:edit, :update]

#Instantiates a new User class
  def new
    if logged_in?
      redirect_to '/posts'
    else
  	@user = User.new
  end
  end

#Shows user in /views/user/show
#Probably won't use
  def show
  	@user = User.find(params[:id])
  end

#Saves user to database
#Autologin when user is created successfully
   def create
  	@user = User.new(user_params)
  	if @user.save
      log_in @user
  		flash[:success] = "Welcome to the Moovers!"
  		redirect_to root_path
  	else
  		render 'new'
  	end
  end

  def edit
    @user = User.find(params[:id])
  end

   def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = 'Profile Updated!'
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

#Defines what a logged in user is
#Determines which pages require a user to be logged in
 def logged_in_user
      unless logged_in?
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end

#Defines the correct user for editing profile, etc.
  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

#Defines user parameters
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :acct_type)
  	end
end
