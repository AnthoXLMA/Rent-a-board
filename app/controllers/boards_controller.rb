class BoardsController < ApplicationController
  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user = current_user
    if @board.save
      redirect_to owner_boards_path
    else
      render :new
    end
  end

  def show
    @board = Board.find(params[:id])
  end
end
