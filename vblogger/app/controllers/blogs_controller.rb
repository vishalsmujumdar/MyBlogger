class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def myblogs
    @loggedblogger = session[:loggedblogger]
    @blogs = Blog.where(["bloggerid = ?", @loggedblogger[:bloggerid]])
  end

  def new
    @blog = Blog.new
  end

  def create
    @loggedblogger = session[:loggedblogger]
    @latestblog = Blog.order("blogid DESC").first
    @latestblogid = getLatestBlogID(@latestblog[:blogid])
    @parameters = {:blogid => @latestblogid, :bloggerid => @loggedblogger[:bloggerid]}
    @parameters.merge!(post_params)
    @parameters[:numberofposts] = 0

    @blog = Blog.new(@parameters)

    if @blog.save
      redirect_to blog_path(@blog), :notice => "Blog created successfully"
    else
      render "new"
    end


  end

  def show
    @blog = Blog.find(params[:id]) 
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def post_params
        params.require(:blog).permit(:blogtitle, :blogdescription)
      end

    def getLatestBlogID(id)
      latestiddate = id[4,8]
      today = Time.now.strftime("%Y%m%d")

      #if latestiddate = today then increment id by 1
      if latestiddate == today
        newid = "BLOG" + (id[4,12].to_i + 1).to_s
      #else create new id with today's date
      else
         newid = "BLOG" + Time.now.strftime("%Y%m%d") + "0001"
      end
    end


end
