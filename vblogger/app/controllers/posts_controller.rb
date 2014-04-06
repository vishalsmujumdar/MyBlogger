class PostsController < ApplicationController
	def index
		@blog = Blog.find(params[:blog_id])
		@posts = Post.where(["blogid = ?", @blog[:blogid]])
	end
	def new
		@blog = Blog.find(params[:blog_id])
		@post = Post.new
	end
	def create
		@loggedblogger = session[:loggedblogger]
		@blog = Blog.find(params[:blog_id])
		
		@parameters = {:blogid => @blog[:blogid] , :bloggerid => @loggedblogger[:bloggerid]}
		@parameters.merge!(post_params)
		@post = Post.new(@parameters)
		
		if @post.save
			redirect_to blog_posts_path(@blog), :notice => "Post saved successfully !"
		else
			render "new"
		end
	end
	def show
		@blog = Blog.find(params[:blog_id])
		@post = Post.find(params[:id])
	end
	def edit
		@blog = Blog.find(params[:blog_id])
		@post = Post.find(params[:id])
	end
	def update
		@post = Post.find(params[:id])
		@blog = Blog.find(params[:blog_id])

		if @post.update_attributes(post_params)
			redirect_to blog_posts_path(@blog), :notice => "Post edited successfully !"
		else
			render "edit"
		end
	end
	def destroy
		@post = Post.find(params[:id])
		@blog = Blog.find(params[:blog_id])

		@post.destroy
		redirect_to blog_posts_path(@blog), :notice => "Post deleted successfully !"
	end
  
	private
		def post_params
    		params.require(:post).permit(:title, :content)
  		end


end
