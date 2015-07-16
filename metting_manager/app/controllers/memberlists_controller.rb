class MemberlistsController < ApplicationController
	def new
    @group = Group.find_by_id(params[:group_id]) 
    @member = Memberlist.new
  end

  def show
    #binding.pry
  	@member = Memberlist.find_by_id(params[:id])
    @user = User.find_by_id(@member.user_id)
  end

	def destroy
		@memberlist = Memberlist.find_by_id(params[:id])
		@memberlist.destroy
    	respond_to do |format|
      	format.html { redirect_to user_group_path(User.find_by_id(params[:user_id]), Group.find_by_id(params[:group_id])), notice: 'Group was successfully destroyed.' }
      	format.json { head :no_content }
    end
  end

    def create
      #binding.pry
    @memberlist = Memberlist.new(:user_id => params[:memberlist][:user_id], :group_id => params[:group_id])

    respond_to do |format|
      if @memberlist.save
        format.html { redirect_to user_group_path(current_user,Group.find_by_id(params[:group_id])), notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @memberlist }
      else
        format.html { render :new }
        format.json { render json: @memberlist.errors, status: :unprocessable_entity }
      end
    end
  end

end