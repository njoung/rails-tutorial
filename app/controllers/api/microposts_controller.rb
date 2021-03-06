class Api::MicropostsController < ApplicationController
  respond_to :json, :html

  def show
    respond_with Micropost.find_by_id(micropost_api_params)
  end
  
  private
    def micropost_api_params
      params.require(:id)
    end
end
