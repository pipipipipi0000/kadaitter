class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweets = Tweet.includes(:user).order("created_at DESC")
  end
end
