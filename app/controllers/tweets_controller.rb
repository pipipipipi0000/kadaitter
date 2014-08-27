class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      redirect_to root_path, notice: "Tweet was successfully created."
    else
      redirect_to root_path, alert: @tweet.errors.full_messages.first
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:text).merge(user_id: current_user.id)
  end
end
