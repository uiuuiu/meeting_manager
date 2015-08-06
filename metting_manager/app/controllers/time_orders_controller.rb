class TimeOrdersController < ApplicationController
  def new
    idlist      =   Array.new
    @time_order   =   TimeOrder.new
    list      =     Array.new
    days      =     Array.new
    months      =     Array.new
    years       =     Array.new
    ids       =     Array.new
    times       =     Array.new
    objlist     =     Array.new
    timelist    =   Array.new
    timeorder_list  =     Array.new
    list  =     params[:time_order][:time_signed].split(",")
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
    objlist.uniq!
    if objlist != nil
    objlist = objlist.sort_by{|f| f[:ids]%100}
    c = objlist.first[:ids]%100
    c1 = objlist.last[:objtime]
    aa = Array.new
    i = 0
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
    # time phan chia
    timelist2 = Array.new
    timelist.each{ |timelist_sub|
    time = Array.new
    time_prev = timelist_sub.first[:ids]
    time_last = timelist_sub.last
    i=0
    tt = Array.new
    timelist_sub.each {|t|
      if t[:ids]-time_prev != 100
        time[i] = tt
        tt = Array.new
        i = i + 1
      end
      if t == time_last
        tt.push(t)
        time[i] = tt
      else
        tt.push(t)
        time_prev = t[:ids]
      end
    }
    time.shift
    timelist2.push(time)
  }
  timelist = timelist2
    # end phan chia
    timelist.each do |f|
      f.each do |u|
          timestart = u.min_by{|a| a[:ids]}[:objtime]
          timeend = u.max_by{|a| a[:ids]}[:objtime]
          length = u.count
          cellid = u.min_by{|a| a[:ids]}[:ids]
          if (Listid.find_by(:idcell => cellid) == nil) || (Listid.find_by(:idcell => cellid) != nil && Listid.find_by(:time_signed => timestart) == nil)
            tior = TimeOrder.create(:user_id => current_user.id, :time_start => timestart, :time_end => timeend, :length => length, :cellid => cellid, :desc => params[:time_order][:user_id], :group_id => params[:time_order][:group_id])
            u.each do |y|
              Listid.create(:idcell => y[:ids], :time_signed => timestart)
          end
          end
          
      end
    end
    end
    @orders = TimeOrder.all
    redirect_to url_for(:controller => :welcome, :action => :index)
    # binding.pry
    # (objlist.size-1).times do
    #   min = objlist.min_by{|a| a[:ids]}
    #   objlist.delete_at(objlist.index(min))
    #   if((min[:ids]%100) == objlist.min_by{|a| a[:ids]}[:ids]%100)
    #     if ((min[:ids]/100) == (objlist.min_by{|a| a[:ids]}[:ids]/100 +1))
    #       min == 
    #     end
      # end
      # (objlist.size-1).times do
      # min = objlist.min_by{|a| a[:ids]}
      # timelist.push(min)
      # objlist.delete_at(objlist.index(min))
      # objlist.each do |f|
      # if ((min[:ids]%100) == f[:ids]%100)
      #   min = objlist.min_by{|a| a[:ids]}
      #   timelist.push(min)
      # else
      #   timeorder_list.push(timelist)
      #   timelist.clear
      # end
  end

  def destroy
      timeorder = TimeOrder.find_by_id(params[:time_order][:id])
      cellid = timeorder.cellid
      celltam = cellid
      timeorder.length.times do
        idlist = Listid.find_by(:idcell => celltam, :time_signed => params[:time_order][:time_signed])
        idlist.destroy
        celltam = celltam + 100
      end
      if timeorder.destroy
        redirect_to url_for(:controller => :welcome, :action => :index)
      end
  end

end
