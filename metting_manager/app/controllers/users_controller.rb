class UsersController < ApplicationController
  def index
  end
  def search
  	@profiles = Profile.where(:name => params[:name]) #lay param chuyen len
  	@users = Array.new #khoi tao 1 mang @user moi
  	@profiles.each do |f| #voi moi cac profiles ta day cac user id vao mang @user
  		@users.push(User.find_by_id(f.user_id))
  	end
  	@group = Group.find_by_id(params[:group_id])#giup dieu huong phai lay group_id
  	redirect_to user_group_path(@group.user_id,@group, :list => @users)#show trang group show
  end

end
