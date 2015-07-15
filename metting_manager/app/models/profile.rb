class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :memberlist

  attr_accessor :is_thumbnable

  def to_param
    name
  end
  
  def self.create_profile(user_id,name)
    Profile.create!(user_id: user_id,name: name)
  end
  
end