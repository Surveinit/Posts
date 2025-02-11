class FollowsController < ApplicationController
  before_action :set_user, only: [ :create, :destroy ]

  def create
    current_user.follow(@user)
    redirect_back fallback_location: root_path, notice: "You have followed #{@user.email}"
  end

  def destroy
    current_user.unfollow(@user)
    redirect_back fallback_location: root_path, notice: "You have unfollowed #{@user.email}"
  end

  private
  def set_user
  @user = User.find_by(id: params[:user_id]) # Use find_by
    unless @user
      redirect_to(root_path, alert: "User not found.")
    end
  end
end
