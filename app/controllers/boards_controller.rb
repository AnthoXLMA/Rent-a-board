class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
    @board.save
  end

  def create
    @user = current_user
    @my_boards = []
    @board = Board.new(board_params)
    @my_boards << @board
    if @board.save
        redirect_to boards_path
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end

  private

  def board_params
    params.require(:board).permit(:name, :size, :brand, :price, :contact, :description)
  end
end
