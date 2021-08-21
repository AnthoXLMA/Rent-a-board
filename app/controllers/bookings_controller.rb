class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def new
    @board = Board.find(params[:id])
    @booking = Booking.new
  end

  def create
    # @booking.user = current_user
    @boards = Board.all
    @board = Board.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.board = @board
    @booking.total_price = ((@booking.end_on - @booking.start_on) / 86_400) * @board.price
    if @booking.save
      redirect_to board_path(@board)
    else
      render 'boards/show'
    end

  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on, :total_price, :board_id)
  end
end
