class BoardsController < ApplicationController
  # before_action :set_board, only: [:show, :index]
  def index
    @user = current_user
    @boards = Board.all
    # @user_avatar = @user.photo
    @board_photo = @boards.each do |board|
      board.photo
    end
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
    # @board.photo = @board.photo.attach(io: File.open(Rails.root.join('db/fixtures/')), filename: '')
    @board.save
    redirect_to boards_path(@boards)
  end

  def show
    @board = Board.find(params[:id])
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
