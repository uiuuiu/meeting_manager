class WelcomeController < ApplicationController
	def index
    
		@time_order = TimeOrder.new
    @orders = TimeOrder.all
    @idlist = Listid.all
	end

	def new 

  @events = Event.all 

  @beginning_current = params[beginning_of_day].try(:to_time) || Time.now
  @time_range = (@beginning_current.beginning_of_day..@beginning_current.end_of_day)

  respond_to do |format| 
   format.html
   format.json { render json: @events }

  end 
 end 
end
