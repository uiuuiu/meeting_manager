class UsersController < ApplicationController
  def index
    
  end

  def search
    @users = Array.new 
  	if params[:find_style]=="name"&&(@profiles = Profile.where(:name => params[:name]))!=nil
       #lay param chuyen len
      @profiles.each do |f| #voi moi cac profiles ta day cac user id vao mang @user
        @users.push(User.find_by_id(f.user_id))
      end
    elsif (@group_name = Group.find_by_name(params[:name]))!=nil
      @member_list = Memberlist.where(:group_id => @group_name.id)
      @member_list.each do |f| #voi moi cac profiles ta day cac user id vao mang @user
        @users.push(User.find_by_id(f.user_id))
      end
    end
  	@group = Group.find_by_id(params[:group_id])#giup dieu huong phai lay group_id
  	redirect_to user_group_path(@group.user_id,@group, :list => @users)#show trang group show
  end

end
