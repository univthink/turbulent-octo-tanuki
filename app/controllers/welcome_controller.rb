class WelcomeController < ApplicationController
  def index
    @posts = Post.all
    render partial: "post/all", layout: "application"
  end

  def about
    render partial: "post/about", layout: "application"
  end

  def contact
    render partial: "post/contact", layout: "application"
  end

  def post
    render partial: "post/post", layout: "application"
  end

  def application
    render template: "layouts/application.html.erb"
  end

  def show
    @post = Post.find(params[:id])
    rrender partial: "post/post", layout: "application"
    @post.save
  end

  def new
    @post = Post.new
    render partial: "post/new", layout: "application"
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @post = Post.find(params[:id])
    render partial: "post/new", layout: "application"
    @post.save
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

  def error
    render partial: "post/error", layout: "error"
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    Post.all
    redirect_to root_path
    @post.save
  end

  def all
    @posts = Post.all
    render partial: "post/all", layout: "application"
  end
end
