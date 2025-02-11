class ReactionsController < ApplicationController
  before_action :find_post

  def create
    @reaction = @post.reactions.build(user: current_user)
    if @reaction.save
      redirect_to post_path(@post), notice: "You liked this post." # Redirect back to the post
    else
      redirect_to post_path(@post), alert: @reaction.errors.full_messages.to_sentence # Handle errors
    end
  end

  def destroy
    @reaction = @post.reactions.find_by(user_id: current_user.id)
    if @reaction
      @reaction.destroy
      redirect_to post_path(@post), notice: "You unliked this post." # Redirect back
    else
      redirect_to post_path(@post), alert: "Reaction not found." # Handle if reaction doesn't exist
    end
  end

  private

  def find_post
    @post = Post.find(params[:post_id])
  end
end
