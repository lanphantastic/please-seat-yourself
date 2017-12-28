class UsersController < ApplicationController

  def index

  end

  def new
    @user = User.new
  end

  def create

  end

  def show

  end

  def edit

  end

  def update

  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :phone, :password, :password_confirm)
  end

end
