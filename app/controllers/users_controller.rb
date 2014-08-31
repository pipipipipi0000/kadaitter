class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_tweets = Tweet.includes(:user).where(user_id: @user.id).page(params[:page])
    @following = Following.find_or_initialize_by(from_id: current_user, to_id: @user)
  end
end
