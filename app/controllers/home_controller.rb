class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @tweet  = Tweet.new
    @tweets = Tweet.includes(:user).order("created_at DESC").page(params[:page])
  end
end
