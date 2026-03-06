class IndividualOrdersController < ApplicationController
  before_action :require_user
  before_action :set_group_order
  before_action :set_individual_order, only: [:edit, :update, :destroy]

  def new
    @meal = Meal.new
    @individual_order = @group_order.individual_orders.build(meal: @meal)
    @menu_items = @group_order.restaurant.menu_items.order(:name)
  end

  def create
    @meal = Meal.new(menu_item_id: meal_params[:menu_item_id])

    if meal_params[:topping_ids].present?
      meal_params[:topping_ids].reject(&:blank?).each do |tid|
        @meal.meal_toppings.build(topping_id: tid)
      end
    end

    if meal_params[:extra_ids].present?
      meal_params[:extra_ids].reject(&:blank?).each do |eid|
        @meal.meal_extras.build(extra_id: eid)
      end
    end

    @individual_order = @group_order.individual_orders.build(
      user: current_user,
      meal: @meal
    )

    if @meal.save && @individual_order.save
      redirect_to @group_order, notice: "Tu pedido fue agregado."
    else
      @menu_items = @group_order.restaurant.menu_items.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @meal = @individual_order.meal
    @menu_items = @group_order.restaurant.menu_items.order(:name)
  end

  def update
    @meal = @individual_order.meal
    @meal.assign_attributes(menu_item_id: meal_params[:menu_item_id])

    @meal.meal_toppings.destroy_all
    if meal_params[:topping_ids].present?
      meal_params[:topping_ids].reject(&:blank?).each do |tid|
        @meal.meal_toppings.build(topping_id: tid)
      end
    end

    @meal.meal_extras.destroy_all
    if meal_params[:extra_ids].present?
      meal_params[:extra_ids].reject(&:blank?).each do |eid|
        @meal.meal_extras.build(extra_id: eid)
      end
    end

    if @meal.save && @individual_order.save
      redirect_to @group_order, notice: "Tu pedido fue actualizado."
    else
      @menu_items = @group_order.restaurant.menu_items.order(:name)
      render :edit, status: :unprocessable_entity
    end
  end

  def toggle_paid
    @individual_order = @group_order.individual_orders.find(params[:id])
    @individual_order.update!(paid: !@individual_order.paid)
    redirect_to @group_order
  end

  def destroy
    @individual_order.destroy
    redirect_to @group_order, notice: "Pedido eliminado."
  end

  private

  def set_group_order
    @group_order = GroupOrder.find(params[:group_order_id])
  end

  def set_individual_order
    @individual_order = @group_order.individual_orders.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:menu_item_id, topping_ids: [], extra_ids: [])
  end
end
