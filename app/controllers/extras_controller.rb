class ExtrasController < ApplicationController
  before_action :set_restaurant_and_menu_item
  before_action :set_extra, only: [:edit, :update, :destroy]

  def new
    @extra = @menu_item.extras.build
  end

  def create
    @extra = @menu_item.extras.build(extra_params)
    if @extra.save
      redirect_to restaurant_menu_item_path(@restaurant, @menu_item), notice: "Extra creado."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @extra.update(extra_params)
      redirect_to restaurant_menu_item_path(@restaurant, @menu_item), notice: "Extra actualizado."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @extra.destroy
    redirect_to restaurant_menu_item_path(@restaurant, @menu_item), notice: "Extra eliminado."
  end

  private

  def set_restaurant_and_menu_item
    @restaurant = Restaurant.find(params[:restaurant_id])
    @menu_item = @restaurant.menu_items.find(params[:menu_item_id])
  end

  def set_extra
    @extra = @menu_item.extras.find(params[:id])
  end

  def extra_params
    params.require(:extra).permit(:name, :price)
  end
end
