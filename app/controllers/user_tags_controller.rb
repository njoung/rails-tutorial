class UserTagsController < ApplicationController
  include UserTagsHelper
  
  # before_action :logged_in_user, only: [:create, :destroy]
  # before_action :correct_user,   only: :destroy

  def destroy
    if destroy_tag tag_params
      flash[:success] = "Tag deleted!"
    else
      flash[:failure] = "Tag could not be deleted"
    end
    redirect_to request.referrer || root_url
  end
  
  private
    def tag_params
      params.require("id")
    end
    
    # def correct_user
    #   debugger
    #   @micropost = current_user.microposts.find_by(id: params[:id])
    #   redirect_to root_url if @micropost.nil?
    # end
end
