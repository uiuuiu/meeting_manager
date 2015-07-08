class AttendedGroupsController < ApplicationController
  
  def index
    @at_group = Group.where(user_id: current_user.id)
  end

end