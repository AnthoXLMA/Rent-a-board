class UsersController < ApplicationController
  def index
    @user = current_user
    @users = User.all
    @user.avatar = @user
  end

  def show
    @user = User.find(params[:id])
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
end
