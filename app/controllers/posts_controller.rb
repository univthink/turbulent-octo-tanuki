class PostsController < ApplicationController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  def index
    @post = Post.all
    render partial: "post/all", layout: "application"
  end

  def show
    @post = Post.find(params[:id])
    render partial: "post/new", layout: "application"
    @post.author_id = @post.author_id + 1
    @post.save
  end

  def new
    @posts = Post.all
    @post = Post.new
    @post.author_id = 1
    render partial: "post/new", layout: "application"
  end

  def create
    @posts = Post.all
    @url3 = request.original_url
    if @url3.split('/')[-1] != "new?fname=BroccoliCasserole"
    @post = Post.new(post_params)
    @post.author_id = 1
    @post.save
    render partial: "post/all", layout: "application"
  else
    render partial: "post/error", layout: "error"
  end
  end

  def edit
    @post = Post.all
    @url = request.original_url
    @post = Post.find(params[:id])
    if @url.split('/')[-1] == "edit?fname1=BroccoliCasserole"
    render partial: "post/new", layout: "application"
    @post.save
    else
      render partial: "post/error", layout: "error"
  end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render partial: "post/new", layout: "application"
    end
    @post.save
  end

  def destroy
    @url1 = request.original_url
    @post = Post.find(params[:id])
    if @url1.split('/')[-1] == "delete?fname=BroccoliCasserole"
    @post.destroy
    Post.all
    redirect_to root_path
    @post.save
  else
    render partial: "post/error", layout: "error"
  end
  end
  def all
    @posts = @posts.sort_by { |post| post.author_id.size }.reverse
    render partial: "post/all", layout: "application"
  end

end
