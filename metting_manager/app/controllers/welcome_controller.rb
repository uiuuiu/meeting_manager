class WelcomeController < ApplicationController
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
  
	def index
    @idlist = Array.new
    if params[:get_time]
      s = params[:get_time].split('/')
      @get_time = Time.new(s[0].to_i,s[1].to_i)
    else
      @get_time = Time.now
    end
		@time_order = TimeOrder.new
    @orders=Array.new
    TimeOrder.all.each{|f|
      if f.time_start > Date.civil(@get_time.strftime("%Y").to_i, @get_time.strftime("%m").to_i, 1) && f.time_end < Date.civil(@get_time.strftime("%Y").to_i, @get_time.strftime("%m").to_i, -1)
        @orders.push(f)
      end
    }
    Listid.all.each {|f|
      if f.time_signed > Date.civil(@get_time.strftime("%Y").to_i, @get_time.strftime("%m").to_i, 1) && f.time_signed < Date.civil(@get_time.strftime("%Y").to_i, @get_time.strftime("%m").to_i, -1)
        @idlist.push(f)
      end
    }
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