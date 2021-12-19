class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    @post.save
    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
    if
      @post.customer == current_customer
    else
      redirect_to posts_path
    end

  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    else
      render :edit
    end
  end

  def index
    @posts = Post.all
  end

  def search
    selection = params[:keyword]
    @posts = Post.sort(selection)
  end

  private

  def post_params
    params.require(:post).permit(:postimage, :name, :address, :caption, :customer_id)
  end

end
