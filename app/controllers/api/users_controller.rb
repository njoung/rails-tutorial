class Api::UsersController < ApplicationController
  respond_to :json, :html
  
  def show
    respond_with User.find(user_api_params) 
  end
  
  private
    def user_api_params
      params.require(:id)
    end
end