class OwnersController < ApplicationController
  def index
    @user= current_user
    @bookings = Booking.all
    @my_bookings = @user.bookings
  end

  def accept
      @booking = Booking.find(params[:id])
      @booking.status = 'accepted'
      @booking.save
      redirect_to owner_bookings_path
  end

  def refuse
    @booking = booking.find(params[:id])
    @booking.status = 'refused'
    @booking.save
    redirect_to owner_bookings_path
  end
end
