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
    @comment = Comment.new
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
    @posts = Post.page(params[:page]).reverse_order
  end

  def search
    selection = params[:keyword]
    @posts = Post.sort(selection)
  end

  def searching
    if params[:name].present?
      @posts = Post.where('name LIKE ?', "%#{params[:name]}%")
    else
      @posts = Post.none
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to posts_path
    end
  end

  private

  def post_params
    params.require(:post).permit(:postimage, :name, :address, :caption, :customer_id, :evaluation)
  end

end
