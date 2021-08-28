class OwnersController < ApplicationController
  def index
    @bookings = Booking.all
    @user= current_user
    @my_bookings = @user.bookings
  end
end
