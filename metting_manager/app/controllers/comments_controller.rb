class CommentsController < ApplicationController
  def create
    @time_order = TimeOrder.find(params[:time_order_id])
    @comment = Comment.create(:time_sign => Time.now,:user_id => current_user.id,:time_order_id => @time_order.id,:desc => params[:comment][:desc])
    # binding.pry
    respond_to do |format|
      format.js
    end
  end

  def destroy
    binding.pry  
  end

end