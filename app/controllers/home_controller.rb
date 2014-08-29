class HomeController < ApplicationController
  def index
    redirect_to :welcome unless user_signed_in?

    @tweet  = Tweet.new
    @tweets = Tweet.includes(:user)
                   .where(user: current_user.followings + [current_user])
                   .page(params[:page])
  end

  def welcome
  end

end
