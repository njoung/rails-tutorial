class Micropost < ActiveRecord::Base
  belongs_to :user
  has_many :user_tags,  class_name:  "UserTag", 
                        foreign_key: "micropost_id",
                        dependent: :destroy
  default_scope -> { order(created_at: :desc) }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size

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