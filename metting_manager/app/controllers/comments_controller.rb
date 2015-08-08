class CommentsController < ApplicationController
  def create
    @time_order = TimeOrder.find(params[:time_order_id])
    @comment = Comment.create(:time_sign => Time.now,:user_id => current_user.id,:time_order_id => @time_order.id,:desc => params[:comment][:desc])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @time_order = TimeOrder.find(params[:time_order_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      format.js
    end
    @comment.destroy 
  end

end