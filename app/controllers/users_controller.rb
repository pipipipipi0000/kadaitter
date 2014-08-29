class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i(show)

  def show
    @user = User.find(params[:id])
    @user_tweets = Tweet.includes(:user).where(user_id: @user.id).page(params[:page])
    @following = Following.find_or_initialize_by(from_id: current_user, to_id: @user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
