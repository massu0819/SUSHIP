class Admin::PostsController < ApplicationController


  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_back(fallback_location: root_path)
    end
  end

end
