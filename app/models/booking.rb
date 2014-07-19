class Booking < ActiveRecord::Base
	validates_presence_of :from,:to,:no_guest

def self.index_result(params,current_user)
	
	if(params[:mybooking])

      @bookings = current_user.guest_bookings

    else
      @bookings = current_user.bookings
    end

end

	def self.date_avail?(prop,from,to)
		return	((from >= prop.avail_from) && (from<= prop.avail_to )&&(to >= prop.avail_from) && (to<= prop.avail_to ))
	end

	def self.combine_date(event,el)
		date = Date.new event[el+"(1i)"].to_i, event[el+"(2i)"].to_i, event[el+"(3i)"].to_i
	end

	def self.accomodate_guests?(prop,guest)

		guest.to_i<=prop.guest 

	end

def self.create_bookings(params,current_user)

	result={}
	from=combine_date params[:booking],"from"
    to=combine_date params[:booking],"to"
    pr=Property.find(params[:booking][:property_id])
    
    avail=date_avail?(pr,from,to) && accomodate_guests?(pr,params[:booking][:no_guest])
   
   if avail  
   
      @booking = current_user.bookings.build(params[:booking])

        if @booking.save
         Rails.logger.debug("herer in create_bookings")

        	result[:redirect]="/bookings/#{@booking.id}"

          # redirect_to(@booking, :id=>@booking.id) 
          
        else

        	result[:redirect] ="/bookings/new?propid=#{pr.id}"
          
        end

    else
		result[:redirect] ="/bookings/new?propid=#{pr.id}"
		
    end
  
return result

end

	belongs_to :user
end
