class Profile < ActiveRecord::Base
  mount_uploader :picture, PictureUploader
  belongs_to :user
  belongs_to :memberlist

  attr_accessor :is_thumbnable

  def to_param
    name
  end
  
  def self.create_profile(user_id,name)
    Profile.create!(user_id: user_id,name: name)
  end
  
  def self.edit_profile(user_id,profile)
    binding.pry
    Profile.find_by_user_id(user_id).update_by(name: profile[:name],level: profile[:level],picture: profile[:picture])
  end

end