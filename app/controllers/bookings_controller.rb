class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
    @user = current_user
  end

  def new
    @board = Board.find(params[:board_id])
    @booking = Booking.new
    @booking.board = @booking
    @booking.save
  end

  def create
    @board = Board.find(params[:board_id])
    @booking = Booking.new(booking_params)
    # @booking.board = @booking.account
    @booking.save
      redirect_to bookings_path
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

  private

  def booking_params
    params.require(:booking).permit(
      :id, :start_on, :end_on, :total_price, :created_at, :updated_at, :status,
      :user_id, :board_id, :schedule_id, :account_id, :customer_id, :owner_id)
  end
end
