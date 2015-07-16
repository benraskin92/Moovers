class UsersController < ApplicationController

#Instantiates a new User class
  def new
  	@user = User.new
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

  private

#Defines user parameters
  	def user_params
  		params.require(:user).permit(:name, :email, :password, :password_confirmation, :acct_type)
  	end
end
