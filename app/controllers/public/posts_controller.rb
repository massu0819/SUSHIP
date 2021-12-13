class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  def show
  end

  def edit
  end

  def update
  end

  def index
  end

  private

  def post_params
    params.require(:post).permit(:postimage, :name, :address, :caption, :customer_id)
  end

end
