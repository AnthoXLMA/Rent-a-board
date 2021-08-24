class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @user = current_user
  end

  def new
    @board = Board.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.save
    @board_booking = @board.booking
    @board_booking.save
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @board = Board.find(params[:board_id])
    # @rental.total_price = ((@rental.end_on - @rental.start_on) / 86_400) * @tree.price
    @booking.board = @board
    if @booking.save
      redirect_to bookings_path
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on, :total_price, :board_id, :user_id)
  end
end
