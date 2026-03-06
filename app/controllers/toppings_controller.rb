class ToppingsController < ApplicationController
  before_action :set_restaurant_and_menu_item
  before_action :set_topping, only: [:edit, :update, :destroy]

  def new
    @topping = @menu_item.toppings.build
  end

  def create
    @topping = @menu_item.toppings.build(topping_params)
    if @topping.save
      redirect_to restaurant_menu_item_path(@restaurant, @menu_item), notice: "Topping creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @topping.update(topping_params)
      redirect_to restaurant_menu_item_path(@restaurant, @menu_item), notice: "Topping actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topping.destroy
    redirect_to restaurant_menu_item_path(@restaurant, @menu_item), notice: "Topping eliminado."
  end

  private

  def set_restaurant_and_menu_item
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu_item = @restaurant.menu_items.find(params[:menu_item_id])
  end

  def set_topping
    @topping = @menu_item.toppings.find(params[:id])
  end

  def topping_params
    params.require(:topping).permit(:name, :price)
  end
end
