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
			redirect_to blogs_path, :notice => "Login successful"
		else
			redirect_to login_index_path, :notice => "Login unsuccessful"
		end
	end

	def signup
		@blogger = Blogger.new
	end
	def signupprocess
		@latestblogger = Blogger.order("bloggerid DESC").first
		@latestbloggerid = getLatestBloggerID(@latestblogger[:bloggerid])
		@parameters = {:bloggerid => @latestbloggerid}
		@parameters.merge!(post_params)

		@blogger = Blogger.new(@parameters)

		if @blogger.save
			redirect_to login_index_path, :notice => "Registration complete. Login to continue"
		else
			render "signup"
		end
	end

	private
		def post_params
    		params.require(:blogger).permit(:name, :username, :email, :password)
  		end

		def getLatestBloggerID(id)
			latestiddate = id[4,8]
			today = Time.now.strftime("%Y%m%d")

			#if latestiddate = today then increment id by 1
			if latestiddate == today
				newid = "BLGR" + (id[4,12].to_i + 1).to_s
			#else create new id with today's date
			else
			   newid = "BLGR" + Time.now.strftime("%Y%m%d") + "0001"
			end
		end

end

#s="BLGR201404050005"
#latestiddate = s[4,8]
#today = Time.now.strftime("%Y%m%d")
#if latestiddate == today
#   newid = "BLGR" + (s[4,12].to_i + 1).to_s
#else
#   newid = "BLGR" + Time.now.strftime("%Y%m%d") + "0001"
#end