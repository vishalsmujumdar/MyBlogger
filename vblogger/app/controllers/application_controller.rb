class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  
  before_filter :set_gon
  

  def clearsession
  	reset_session
  	set_gon
  	redirect_to login_index_path, :notice=>"Logout successful"
  end

  def getsessionforjs
	  	
  end

  def set_gon
   		@loggedblogger = session[:loggedblogger]
   		gon.watch.sessionuser = @loggedblogger
   		#gon.watch.test = 0
  end

  private

  	


end
