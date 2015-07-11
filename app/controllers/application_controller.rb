class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  def require_user
    if current_user
      true
    else
      redirect_to login_path, notice: "You must be logged in to access that page."
    end
  end
  
end
