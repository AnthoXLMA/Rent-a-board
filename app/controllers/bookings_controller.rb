class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @user = current_user
  end

  def new
    @board = Board.find(params[:id])
    @booking = Booking.new(booking_params)
    @booking.save
  end

  # def create
  #   @user = current_user
  #   @board = Board.find(params[:board_id])
  #   @booking = Booking.new(booking_params)
  #   @booking.board = @board
  #   # @my_bookings = []
  #   # @booking.total_price = ((@booking.end_on - @booking.start_on) / 86_400) * @board.price
  #   @booking.board.save
  #     redirect_to board_bookings_path(@board)
  #     # redirect_to current_user
  # end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @board = Board.find(params[:board_id])
    # @rental.total_price = ((@rental.end_on - @rental.start_on) / 86_400) * @tree.price
    @booking.board = @board
  end

  private

  def booking_params
    params.require(:booking).permit(:start_on, :end_on, :total_price, :board_id, :user_id)
  end
end
