class Micropost < ActiveRecord::Base
  include UserTagsHelper
  include UsersHelper

  belongs_to :user
  has_many :user_tags,  class_name:  "UserTag", 
                        foreign_key: "micropost_id",
                        dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  # after_find :create_tags
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

  def create_tags params
    # TODO: Make tagged_user_email a list
    params["user_tags"]["tagged_user_emails"].split(" ").each do |email|
      if not create_tag self, ActionController::Parameters.new(
                                {tagged_user: user_from_email(email)}
                              )
        flash[:failure] = "Could not tag user #{email}"
      end
    end
  end
  
  private
    # VALID_EMAIL_REGEX = /@[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\b/i
    
    # def geekify(string)
    #     d =  { "njoung@yahoo.com" => "Nick Joung" }
    #     # string.gsub!(/[leto]/) {|match| d[match]}
    #     string.gsub!(VALID_EMAIL_REGEX) {|match| 
    #         d[match[1..-1]] || match[1..-1]
    #     }
    # end

    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end