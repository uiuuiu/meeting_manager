class User < ActiveRecord::Base
  has_one :profile
  attr_accessible :email, :password, :password_confirmation
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
