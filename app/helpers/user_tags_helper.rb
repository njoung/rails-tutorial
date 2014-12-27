module UserTagsHelper
  include UsersHelper

  def create_tag micropost, email
    @user_tag = micropost.user_tags.create({user: user_from_email(email)})
  end

  def destroy_tag tag_id
    if (tag = UserTag.find_by_id(tag_id))
      tag.delete
      true
    else
      false
    end
  end
  
end
