class TimeOrdersController < ApplicationController
	def new
		idlist 			=		Array.new
		@time_order		=		TimeOrder.new
		list 			= 		Array.new
		days 			= 		Array.new
		months 			= 		Array.new
		years 			= 		Array.new
		ids 			= 		Array.new
		times 			= 		Array.new
		objlist 		= 		Array.new
		timelist 		=		Array.new
		timeorder_list  = 		Array.new
		list 	= 		params[:time_order][:time_signed].split(",")
		list.each do |f|
			arr = f.split(" ")
			a = DateTime.new
			# times.push(arr[0].to_i)
			# months.push(arr[1].to_i)
			# years.push(arr[2].to_i)
			# days.push(arr[3].to_i)
			# datetime = arr[2]+"-"+arr[1]+"-"+arr[3]+"T"+arr[0]
			a = DateTime.new(arr[2].to_i,arr[1].to_i,arr[3].to_i,arr[0].to_i,0,0);
			obj = {
		    :objtime => a, 
			:ids => arr[4].to_i
			}
			objlist.push(obj)
		end
		if objlist != nil
		objlist = objlist.sort_by{|f| f[:ids]%100}
		c = objlist.first[:ids]%100
		c1 = objlist.last[:objtime]
		aa = Array.new
		i = 0
		objlist.uniq!
		objlist.each{|f|
					if f[:ids]%100 != c
						timelist[i] = aa
						aa = Array.new
						c = f[:ids]%100
						i = i+1	
					end
					if f[:objtime] == c1
						timelist[i] = aa	
					end
					aa.push(f)
		}
		timelist.each do |f|
			timestart = f.min_by{|a| a[:ids]}[:objtime]
			timeend = f.max_by{|a| a[:ids]}[:objtime]
			length = f.count
			cellid = f.min_by{|a| a[:ids]}[:ids]
			if (Listid.find_by(:idcell => cellid) == nil) || (Listid.find_by(:idcell => cellid) != nil && Listid.find_by(:time_signed => timestart) == nil)
				tior = TimeOrder.create(:user_id => current_user.id, :time_start => timestart, :time_end => timeend, :length => length, :cellid => cellid, :desc => params[:time_order][:user_id])
			end
		end
		objlist.each do |f|
			if (Listid.find_by(:idcell => f[:ids]) == nil) || (Listid.find_by(:idcell => f[:ids]) != nil && Listid.find_by(:time_signed => f[:objtime]) == nil)
				Listid.create(:idcell => f[:ids], :time_signed => f[:objtime])
			end
		end
		end
		@orders = TimeOrder.all
		# binding.pry
		# (objlist.size-1).times do
		# 	min = objlist.min_by{|a| a[:ids]}
		# 	objlist.delete_at(objlist.index(min))
		# 	if((min[:ids]%100) == objlist.min_by{|a| a[:ids]}[:ids]%100)
		# 		if ((min[:ids]/100) == (objlist.min_by{|a| a[:ids]}[:ids]/100 +1))
		# 			min == 
		# 		end
			# end
			# (objlist.size-1).times do
			# min = objlist.min_by{|a| a[:ids]}
			# timelist.push(min)
			# objlist.delete_at(objlist.index(min))
			# objlist.each do |f|
			# if ((min[:ids]%100) == f[:ids]%100)
			# 	min = objlist.min_by{|a| a[:ids]}
			# 	timelist.push(min)
			# else
			# 	timeorder_list.push(timelist)
			# 	timelist.clear
			# end
	end
end
