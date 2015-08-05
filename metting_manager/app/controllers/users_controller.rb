class UsersController < ApplicationController
  load_and_authorize_resource
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def index
  end
  def search
    
    @users = Array.new
    @groups =Array.new 
    @group = Group.find_by_id(params[:group_id])#giup dieu huong phai lay group_id
    if params[:find_style]=="name"&&(@profiles = Profile.where(["name LIKE ?", "%#{params[:name]}%"]))!=nil
       #:name => params[:name]
       #lay param chuyen len
       @profiles.each do |f| #voi moi cac profiles ta day cac user id vao mang @user
        @users.push(User.find_by_id(f.user_id))
       end
       redirect_to user_group_path(@group.user_id,@group, :listu => @users)
    elsif (@group_name = Group.where(["name LIKE ?", "%#{params[:name]}%"]))!=nil
    
      @group_name.each do |x|
       @groups.push( Group.find_by_id(x.id))
      end
     redirect_to user_group_path(@group.user_id,@group, :listg => @groups)#show trang group sho
    
    end
  end
end