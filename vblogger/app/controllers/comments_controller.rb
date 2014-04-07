class CommentsController < ApplicationController

	def create
		@blog = Blog.find(params[:blog_id])
	    @post = Post.find(params[:post_id])
		@loggedblogger = session[:loggedblogger]

		@latestcomment = @post.comments.order("commentid DESC").first
    	@latestcommentid = getLatestCommentID(@latestcomment ? @latestcomment[:commentid] : "empty")
	    
	    @parameters = {:commentid=>@latestcommentid,:postid=>@post[:postid],:bloggerid=>@loggedblogger[:bloggerid]}
	    @parameters.merge!(post_params)

	    @comment = @post.comments.create(@parameters)
		redirect_to "/blogs/#{@blog.id}/posts/#{@post.id}"
	end


	private
		def post_params
    		params.require(:comment).permit(:commenttext)
  		end
  		def getLatestCommentID(id)
		  if id == "empty"
		    newid = "CMNT" + Time.now.strftime("%Y%m%d") + "0001"
	      else
			latestiddate = id[4,8]
	      	today = Time.now.strftime("%Y%m%d")

		    #if latestiddate = today then increment id by 1
		    if latestiddate == today
		      newid = "CMNT" + (id[4,12].to_i + 1).to_s
		    #else create new id with today's date
		    else
		       newid = "CMNT" + Time.now.strftime("%Y%m%d") + "0001"
		    end
	      end		
	    end
end
