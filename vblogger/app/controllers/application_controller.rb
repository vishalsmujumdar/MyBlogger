class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def clearsession
  	reset_session
  	redirect_to login_index_path, :notice=>"Logout successful"
  end
end
