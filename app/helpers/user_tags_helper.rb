module UserTagsHelper
  
  def create_tag micropost, params
    debugger
    @user_tag = micropost.user_tag.new(tag_params params)
    if not @user_tag.save
      false
    end
  end

  def destroy_tag
    @user_tag.destroy
    flash[:success] = "Tag deleted"
  end
  
  private
    def tag_params params
      {tagged_user: params.require("tagged_user")}
    end
end
