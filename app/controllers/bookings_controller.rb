class BookingsController < ApplicationController
  include BookingsHelper
  # GET /bookings
  # GET /bookings.xml

  def index
    @bookings=Booking.index_result params,current_user
  end

  # GET /bookings/1
  # GET /bookings/1.xml
  def show
    @booking = Booking.find(params[:id])
  end

  # GET /bookings/new
  # GET /bookings/new.xml
  def new
    @booking = Booking.new 
    @propid= params[:propid]
  end

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.xml
  def create
    
    handle_redirection Booking.create_bookings params,current_user
   #  from=combine_date params[:booking],"from"
   #  to=combine_date params[:booking],"to"
   #  pr=Property.find(params[:booking][:property_id])
    
   #  avail=date_avail?(pr,from,to) && accomodate_guests?(pr,params[:booking][:no_guest])
   
   # if avail  
   
   #    @booking = current_user.bookings.build(params[:booking])

   #      if @booking.save
   #        redirect_to(@booking, :id=>@booking.id) 
          
   #      else
   #         render :action => "new" 
          
   #      end

   #  else


   #    redirect_to (new_booking_url(:propid=>params[:booking][:property_id]))
   #  end
  
  end

  # PUT /bookings/1
  # PUT /bookings/1.xml
  def update
     from=combine_date params[:booking],"from"
    to=combine_date params[:booking],"to"
    pr=Property.find(params[:booking][:property_id])
    
    avail=date_avail?(pr,from,to) && accomodate_guests?(pr,params[:booking][:no_guest])
   
   if avail  
   
    @booking = Booking.find(params[:id])

      if @booking.update_attributes(params[:booking])
         redirect_to(@booking, :id=>@booking.id) 
        
      else
         render :action => "edit" 
        
      
      end

    else


      redirect_to (new_booking_url(:propid=>params[:booking][:property_id]))
    end
  
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.xml
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

       redirect_to(bookings_url) 
      
    
  end
end
