class Profile < ActiveRecord::Base
  belongs_to :user
  belongs_to :memberlist

  validates :name, presence: true
  validates :level, presence: true, length: { maximum: 540 }
  validates :picture, presence: true
  attr_accessor :is_thumbnable

  def to_param
    name
  end
  
end
