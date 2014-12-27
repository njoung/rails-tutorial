module MicropostsHelper
  
  def has_tag?(tags)
    tags.any?
  end
  
  def remove_tag?(user)
    current_user.admin or current_user == user
  end
end
