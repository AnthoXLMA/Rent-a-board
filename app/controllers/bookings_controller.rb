class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @booking = Board.find(params[:board_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @board = Board.find(params[:board_id])
    @booking.total_price = ((@booking.end_on - @booking.start_on) / 86_400) * @board.price
    @booking.board = @board

    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on, :total_price, :board_id)
  end
end
