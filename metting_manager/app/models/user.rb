class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :groups
   has_one :profile
   has_many :time_orders
   has_many :comments
   
   def self.create_user(user)
     User.create(email: user[:email],password: user[:password])
   end
   
  def admin?
    if self.id.nil?
       false
    else
      self.role_id ==1   
    end 
  end

  def user?
    if self.id.nil?
        false
    else
        self.role_id ==2 || self.role_id ==3
    end 
  end

end