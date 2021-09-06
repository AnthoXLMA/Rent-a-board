class CustomerController < ApplicationController
  def index
    @customers = Customer.all
    @my_customers = @customers.owner
  end

  def new
    @customer = Customer.new
  end

  def create
    @user = current_user
    @bookings = Booking.all
    @customer = @booking.board.customer
  end

  def update
  end

  def show
    @customer = Customer.find(params[:id])
  end
end
