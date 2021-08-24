class BoardsController < ApplicationController
  # before_action :set_board, only: [:show, :index]
#   before_action :set_board, only: [:show]

#   def index
#     @boards = Board.paginate(:page => params[:page], :per_page => 6).order('sort ASC')
#   end

#   def show
#     @others = Board.paginate(:page => params[:page], :per_page => 4).order('sort ASC')
#   end

# private

# def set_board
#     @board = Board.find(params[:id])
# end

  def index
    @user = current_user
    @boards = Board.all
    @board = @boards.each do |board|
      board
    end
    # @surfers = User.all
    # @surfer = @surfers.each do |surfer|
    #   surfer
    # end
    # @surfman = @surfer.find(params[:id])
    # @board_photo = @boards.each do |board|
    #   board.photo
    # end
  end

  def new
    @board = Board.new
    @board.save
  end

  def create
    @user = current_user
    @board = Board.new(board_params)
    @board_photo = @board.photo
    @board.user = @user
      @board.save
        redirect_to boards_path(@boards)
  end

  def show
    @bookings = Booking.all
    @booking = Booking.new
    @board = Board.find(params[:id])
    # @surfboard = Board.where(id: :id)
    @booking.board = @board
    # @booking.total_price = ((@booking.end_on - @booking.start_on) / 86_400) * @board.price
    if @booking.save
      redirect_to boards_path(board)
    else
      render 'boards/show'
    end
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :size, :brand, :price, :contact,
    :description, :supplier_id, :address, :user_id, :photo)
  end
end
