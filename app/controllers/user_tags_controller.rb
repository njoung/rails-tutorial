class UserTagsController < ApplicationController
  include UserTagsHelper
  
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    debugger
    # TODO
    if not create_tag micropost params
      debugger
      flash[:failure] = "Could not tag user #{params["user_tag"]["tagged_user_email"]}"
    end
  end

  def destroy
    debugger
    destroy_tag
  end


end
