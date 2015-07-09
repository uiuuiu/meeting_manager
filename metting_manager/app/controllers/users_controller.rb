class UsersController < ApplicationController
  def index
    if current_user!=nil
      @at_group = Group.where(user_id: current_user.id)
    end
  end
  
end
