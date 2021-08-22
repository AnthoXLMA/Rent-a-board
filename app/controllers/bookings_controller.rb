class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @board = Board.find(params[:id])
    @booking = Booking.new
  end

  def create
    @board = Board.find(params[:board_id])
    @booking = Booking.new(booking_params)
    @booking.board = @board
    @my_bookings = []
    # @booking.total_price = ((@booking.end_on - @booking.start_on) / 86_400) * @board.price
    @booking.board.save
      redirect_to bookings_path(@board)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on, :total_price, :board_id)
  end
end
