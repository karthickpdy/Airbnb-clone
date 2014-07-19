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
   
  end

  # PUT /bookings/1
  # PUT /bookings/1.xml
  def update


     handle_redirection Booking.update_bookings params,current_user
   
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.xml
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to(bookings_url) 
      
    
  end
end
