class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @user = current_user
    @booking = @user.bookings
  end

  def new
    @board = Board.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.save
  end

  def create
    @user = current_user
    @board = Board.find(params[:board_id])
    @booking = Booking.new(booking_params)
    @booking.board = @board
    @booking.board.user = @user
    # @my_bookings = []
    # @booking.total_price = ((@booking.end_on - @booking.start_on) / 86_400) * @board.price
    @booking.board.save
      redirect_to bookings_path(@board)
      # redirect_to current_user
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on, :total_price, :board_id)
  end
end
