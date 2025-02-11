class PostsController < ApplicationController
  def index
    # @posts = Post.where(created_at: 7.days.ago..Time.now).order(created_at: :desc)
    @posts = Post.joins(:user).where(user: [current_user, *current_user.following]).order(created_at: :desc)
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
