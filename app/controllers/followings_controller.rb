class FollowingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_following, only: %i(destroy)

  def create
    @following = Following.new(following_params)

    if @following.save
      redirect_to :back, notice: "Following was successfully created."
    else
      redirect_to :back, alert: @following.errors.full_messages.first
    end
  end

  def destroy
    @following.destroy
    redirect_to :back, notice: "Following was successfully destroyed."
  end

  private

  def set_following
    @following = Following.find(params[:id])
  end

  def following_params
    params.require(:following).permit(:to_id).merge(from_id: current_user.id)
  end
end
