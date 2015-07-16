class SessionsController < ApplicationController

#Instantiates new Session class
  def new
  end

#Saves user session to cookies
#Automatically logs user in using 'log_in user' method
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		redirect_to root_path
  	else
  		flash.now[:danger] = 'Invalid email/password combination'
  		render 'new'
  	end
  end

#Logs user out
  def destroy
  	log_out
  	redirect_to root_path
  end
end
