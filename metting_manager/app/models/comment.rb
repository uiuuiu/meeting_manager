class Comment < ActiveRecord::Base
  belongs_to :time_order
  belongs_to :user
end
