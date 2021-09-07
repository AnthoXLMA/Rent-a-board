class OwnersController < ApplicationController
    before_action :set_owner, only: [:show]

  def index
    @user= current_user
    @owners = Owner.all
    @bookings = Booking.all
    @my_bookings = @booking.user
  end

  def show
    @owner = Owner.find(params[:id])
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

  def set_owner
    @owner = Owner.find(params[:id])
  end

  def user_params
    params.require(:owner).permit(:user_id)
  end
end
