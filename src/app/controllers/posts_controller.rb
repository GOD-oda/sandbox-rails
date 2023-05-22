class PostsController < ApplicationController
  def new
    @post = Post.new
    @post.comments.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render :new
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:title, comments_attributes: [:id, :body])
  end
end
