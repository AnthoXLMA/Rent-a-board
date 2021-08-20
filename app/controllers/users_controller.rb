class UsersController < ApplicationController

  def index
    @user = user_current
    @users = User.all
    @user.avatar = @user
  end

  def show
    @user = User.find(params[:id])
    @boards = Board.all
    @board_photo = @boards.each do |board|
      board.photo
    end
  end

  def new
    @user = User.new
    @user.save
  end

  def create
    @user = User.new
    @user.save
  end

  # def login
  # end

  # def logout
  # end
  private
  def set_board
    @User = User.find(params[:id])
  end
end
