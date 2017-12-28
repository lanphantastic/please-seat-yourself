class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search]).order("created_at DESC")
    else
      Restaurant.all
    end
  end

  def new
    if current_user.restaurant
      flash[:notice] = "You have already created a restaurant"
      redirect_to admin_path
    else
      @restaurant = Restaurant.new
    end
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

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :price_range, :total_seats, :open_hour, :close_hour, :description, :image, :twitter_handle)
  end
end
