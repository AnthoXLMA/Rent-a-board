class UsersController < ApplicationController

  def index
    @user = user_current
    @users = User.all
    @user.photo = @user
    @markers = @users.geocoded.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { user: user }),
        image_url: helpers.asset_url('mapbox-marker-icon-green.svg')
      }
    end
  end

  def show
    @user = User.find(params[:id])
    @boards = Board.all
    @board = Board.find(params[:id])
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
  def set_user
    @User = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :email)
  end
end
