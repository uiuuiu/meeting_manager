class TimeOrdersController < ApplicationController
	def new
		list 	= 		Array.new
		days 	= 		Array.new
		months 	= 		Array.new
		years 	= 		Array.new
		ids 	= 		Array.new
		times 	= 		Array.new
		objlist = 		Array.new
		list 	= 		params[:time_order][:time_signed].split(",")
		list.each do |f|
			arr = f.split(" ")
			a = Time.new
			# times.push(arr[0].to_i)
			# months.push(arr[1].to_i)
			# years.push(arr[2].to_i)
			# days.push(arr[3].to_i)
			datetime = arr[2]+"-"+arr[1]+"-"+arr[3]+" "+arr[0]
			a = Time.parse(datetime);
			obj = {
		    :objtime => a, 
			:ids => arr[4].to_i
			}
			objlist.push(obj)
		end
		binding.pry
	end
end
