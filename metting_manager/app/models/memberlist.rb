class Memberlist < ActiveRecord::Base
	has_many :users
	belongs_to :group
  has_many :profiles
	

	def self.search(search)
	  search_condition = "%" + search + "%"
	  find(:all, :conditions => ['title LIKE ? OR description LIKE ?', search_condition, search_condition])
	end
end
