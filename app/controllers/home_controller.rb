class HomeController < ApplicationController
  def index
    redirect_to :welcome unless user_signed_in?

    @tweet  = Tweet.new
    @tweets = Tweet.includes(:user).page(params[:page])
  end

  def welcome
  end

end
