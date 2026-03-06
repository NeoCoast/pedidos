class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.order(:name)
  end

  def show
    @menu_items = @restaurant.menu_items.includes(:toppings, :extras).order(:name)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "Restaurante creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to @restaurant, notice: "Restaurante actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @restaurant.destroy
      redirect_to restaurants_path, notice: "Restaurante eliminado."
    else
      redirect_to @restaurant, alert: @restaurant.errors.full_messages.join(", ")
    end
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :url)
  end
end
