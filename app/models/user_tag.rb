class UserTag < ActiveRecord::Base
  belongs_to :micropost, class_name: "Micropost"
  belongs_to :user, class_name: "User"
  validates :micropost_id, presence: true
  validates :user_id, presence: true
end
