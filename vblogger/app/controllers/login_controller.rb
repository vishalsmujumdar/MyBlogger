class LoginController < ApplicationController
	def index
		@blogger = Blogger.new
	end

	def validate
		@data = params[:blogger]
		@blogger = Blogger.find_by username: @data[:username]

		#@flag = "empty"	if  @loggedblogger == nil
		#@flag = @loggedblogger[:name] if @loggedblogger != nil

		if @blogger[:username] == @data[:username] && @blogger[:password] == @data[:password]
			session[:loggedblogger] = @blogger
			redirect_to posts_path, :notice => "Login successful"
		else
			redirect_to login_index_path, :notice => "Login unsuccessful"
		end
	end

	def signup
	end

	
end
