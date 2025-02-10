class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comments = Comment.where(commentable: @post, parent_id: nil)
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to(posts_path, notice: "Post created successfully.")
    else
      redirect_to(posts_path, notice: "Failed to create post.")
    end
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
