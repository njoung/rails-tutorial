class FollowerRequestsController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:followed_id])
    current_user.request_follow(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @user = FollowerRequest.find(params[:id]).followed
    current_user.request_cancel(@user)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end
end