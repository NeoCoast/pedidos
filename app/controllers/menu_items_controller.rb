class MenuItemsController < ApplicationController
  before_action :set_restaurant
  before_action :set_menu_item, only: [:show, :edit, :update, :destroy]

  def index
    redirect_to @restaurant
  end

  def show; end

  def new
    @menu_item = @restaurant.menu_items.build
  end

  def create
    @menu_item = @restaurant.menu_items.build(menu_item_params)
    if @menu_item.save
      redirect_to @restaurant, notice: "Item del menú creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @menu_item.update(menu_item_params)
      redirect_to @restaurant, notice: "Item del menú actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item.destroy
    redirect_to @restaurant, notice: "Item del menú eliminado."
  end

  def options
    @menu_item = MenuItem.find(params[:id])
    @toppings = @menu_item.toppings
    @extras = @menu_item.extras

    render partial: "menu_items/options", locals: { toppings: @toppings, extras: @extras, menu_item: @menu_item }
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id]) if params[:restaurant_id]
  end

  def set_menu_item
    @menu_item = @restaurant.menu_items.find(params[:id])
  end

  def menu_item_params
    params.require(:menu_item).permit(:name, :price)
  end
end
