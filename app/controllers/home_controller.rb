class HomeController < ApplicationController
  def index
    unless user_signed_in?
      redirect_to :welcome and return
    end

    @active_users = User.active - [current_user]
    @tweet        = Tweet.new
    @tweets       = Tweet.includes(:user)
                         .where(user: current_user.followings + [current_user])
                         .page(params[:page])
  end

  def welcome
  end

end
