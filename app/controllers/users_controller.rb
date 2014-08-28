class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user_tweets = Tweet.where(user_id: @user.id).page(params[:page])
  end
end
