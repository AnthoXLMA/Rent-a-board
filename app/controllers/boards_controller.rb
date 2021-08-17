class BoardsController < ApplicationController
  before_action :set_board, only: [:show]
  def index
    @user = current_user
    @boards = Board.all
  end

  def new
    @board = Board.new
    @board.save
  end

  def create
    @user = current_user
    @board = Board.new(board_params)
    @board.user = @user
    if @board.save
      redirect_to boards_path(@boards)
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  private

  def set_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name, :size, :brand, :price, :contact, :description, :supplier_id, :address, :user_id)
  end
end
