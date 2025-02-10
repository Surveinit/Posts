class CommentsController < ApplicationController
  before_action :find_post

  def create
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user
    @comment.post_id = @post.id # Explicitly set the post_id  <--- This is crucial

    if @comment.save
      redirect_to post_path(@post), notice: "Comment created successfully."
    else
      Rails.logger.error(@comment.errors.full_messages.join(", ")) # Log the errors!
      redirect_to post_path(@post), alert: "Failed to create comment. #{@comment.errors.full_messages.join(', ')}"  # Display errors to the user
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
