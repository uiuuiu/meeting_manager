class WelcomeController < ApplicationController
	def index
    if params[:get_time]
      s = params[:get_time].split('/')
      @get_time = Time.new(s[0].to_i,s[1].to_i)
    else
      @get_time = Time.now
    end
		@time_order = TimeOrder.new
    @orders=Array.new
    TimeOrder.all.each{|f|
      if f.time_start > @get_time && f.time_end < @get_time
        @orders.push(f)
      end
    }
    @idlist = Listid.all
    @time = Time.now
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