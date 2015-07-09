class Profile < ActiveRecord::Base
  attr_accessible :name, :level, :picture, :user_id
  mount_uploader :picture, PictureUploader
  validates :name, presence: true
  validates :level, presence: true, length: { maximum: 540 }
  validates :picture, presence: true
  attr_accessor :is_thumbnable
  belongs_to :user
end
