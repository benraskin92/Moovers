module SessionsHelper

#Method to log in user
	def log_in(user)
		session[:user_id] = user.id
	end

#Defines what a current user is
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

#What does it mean to be logged in
	def logged_in?
		!current_user.nil?
	end

#Log out method
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

#**** COME BACK ****#
	def current_user?(user)
		user == current_user
	end
end
