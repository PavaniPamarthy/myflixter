class Photo < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :course
  belongs_to :user

end
