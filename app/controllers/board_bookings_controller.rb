class BoardBookingsController < ApplicationController
  def index
    @board_bookings = BoardBooking.all
  end

  def new
    @board_booking = BoardBooking.new
    @board_booking.save
  end

  def create
    @user = current_user
    @board = Board.find(params[:id])
    @booking = Booking.find(params[:id])
    @board_booking = BoardBooking.new(board_bookings_params)
    @board_booking.user.booking = @board_booking
    @board_booking.save
  end

  private

  def board_booking_params
    params.require(:board_booking).permit(:board_id, :booking_id)
  end
end
