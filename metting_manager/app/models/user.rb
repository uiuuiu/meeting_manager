class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :groups
   has_one :profile
   
   def self.create_user(user)
     User.create(email: user[:email],password: user[:password])
   end
   
end
