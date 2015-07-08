class GroupsController < ApplicationController

  def index

  end

  def profile
    @group = Group.where(id: params[:group_id].to_i)
  end

end
