class AddUserTagsToMicroposts < ActiveRecord::Migration
  def change
    add_reference :microposts, :user_tag, index: true
    add_foreign_key :microposts, :user_tag
  end
end
