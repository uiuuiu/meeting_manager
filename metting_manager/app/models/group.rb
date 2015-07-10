class Group < ActiveRecord::Base
	has_many :memberlists
	belongs_to :user
end
