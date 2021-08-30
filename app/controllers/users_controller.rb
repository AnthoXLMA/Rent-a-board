class UsersController < ApplicationController

  def index
    @user = user_current
    @users = User.all
    @user.photo = @user
  end

  def show
    @user = User.find(params[:id])
    @user_photo = @user.photo
    @boards = Board.all
    @board = Board.find(params[:id])
    @board_photo = @boards.each do |board|
      board.photo
    end
    @bookings = Booking.all
  end

  def new
    @user = User.new
    @user.save
    @account = Account.new
    # @user = User.new
    @client = Client.new
    @booking = Booking.new
    @board_payment = BoardPayment.new
    @schedules = Schedule.where('start >= ? and start <=  ?', Date.today + 1.day, Date.today + 2.weeks).where(title: 'Available').order('start ASC').all
  end

  def create
    @user = User.new
    @user.save
    create_client_charge
    create_client_account
    @user = User.new(user_params)
    @user.account_id = @account.id

    respond_to do |format|
      if @user.save
        create_client_profile
        create_client_booking
        create_client_lesson_payment
        auto_login(@user)
        UserMailer.new_signup_booking_admin(@user, @booking).deliver_later
        UserMailer.new_signup_booking_client(@user, @booking).deliver_later
        format.html { redirect_to dashboard_url, notice: 'Your account was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_back fallback_location: root_path, alert: 'An error occurred while sending this request.' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
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

  def set_user
    @User = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :email)
  end

  def set_board
    @board = Board.find(params[:board_id])
  end

  def create_client_account
    @account = Account.new()
    @account.status = 'active'
    @account.account = 'prefix-' + SecureRandom.hex(4)
    @account.account_type = 'client'
    @account.save
  end

  def create_client_profile
    @client = Client.new()
    @client.firstname = params[:user][:client][:firstname]
    @client.lastname = params[:user][:client][:lastname]
    @client.phone = params[:user][:client][:phone]
    @client.user_id = @user.id
    @client.account_id = @user.account_id
    @client.save
  end

  def create_customer_booking
    @board= Board.find(params[:user][:booking][:board_id])
    @booking = Booking.new()
    @booking.board_id = params[:user][:booking][:board_id]
    @booking.schedule_id = params[:user][:booking][:schedule_id]
    @booking.client_id = @client.id
    @booking.account_id = @user.account_id
    @booking.title = @board.title
    @booking.cost = @board.cost
    @booking.status = 'Booked'
    @booking.save
    @schedule = Schedule.find(params[:user][:booking][:schedule_id])
    @booking.trainer_id = @schedule.trainer_id
    @booking.start = @schedule.start
    @booking.refunded = 0
    @booking.save
    @schedule.title = 'Booked'
    @schedule.save
  end

  def create_customer_board_payment
    @board_payment = boardPayment.new()
    @board_payment.status = 'Paid'
    @board_payment.date = Date.today
    @board_payment.cost = @board.cost
    @board_payment.service = @board.title
    @board_payment.booking_id = @booking.id
    @board_payment.account_id = @user.account_id
    @board_payment.save
  end
end

