class GroupOrdersController < ApplicationController
  before_action :require_user, only: [:new, :create]
  before_action :set_group_order, only: [:show, :destroy, :advance_status, :revert_status, :update_discount, :update_discount_from_total, :update_bank_account]

  def index
    @active_orders = GroupOrder.where(status: %w[open closed ordered])
                               .includes(:restaurant, :creator, individual_orders: :user)
                               .order(date: :desc)
    @delivered_orders = GroupOrder.where(status: "delivered")
                                  .includes(:restaurant, :creator)
                                  .order(date: :desc)
  end

  def show
    @individual_orders = @group_order.individual_orders.includes(:user, :order_shares, shared_users: [], meal: [:menu_item, :toppings, :extras])
    @menu_items = @group_order.restaurant.menu_items.order(:name)
    @meal = Meal.new
    @individual_order = @group_order.individual_orders.build(meal: @meal)
  end

  def new
    @group_order = GroupOrder.new(date: Date.today, status: "open")
    @restaurants = Restaurant.order(:name)
  end

  def create
    @group_order = GroupOrder.new(group_order_params)
    @group_order.creator = current_user
    @group_order.status = "open"

    if @group_order.save
      redirect_to @group_order, notice: "Pedido grupal creado."
    else
      @restaurants = Restaurant.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  def advance_status
    unless current_user == @group_order.creator
      return redirect_to @group_order, alert: "Solo el creador puede cambiar el estado."
    end

    if @group_order.advance_status!
      redirect_to @group_order, notice: "Estado actualizado a #{@group_order.status}."
    else
      redirect_to @group_order, alert: "No se puede avanzar el estado."
    end
  end

  def revert_status
    unless current_user == @group_order.creator
      return redirect_to @group_order, alert: "Solo el creador puede cambiar el estado."
    end

    if @group_order.revert_status!
      redirect_to @group_order, notice: "Estado revertido a #{@group_order.status}."
    else
      redirect_to @group_order, alert: "No se puede retroceder el estado."
    end
  end

  def update_discount
    if @group_order.update(percentage_discount: params[:group_order][:percentage_discount])
      redirect_to @group_order, notice: "Descuento actualizado."
    else
      redirect_to @group_order, alert: "No se pudo actualizar el descuento."
    end
  end

  def update_discount_from_total
    total_paid = params[:group_order][:total_paid].to_f
    grand_total = @group_order.grand_total

    if grand_total > 0 && total_paid > 0
      percentage = ((1 - total_paid / grand_total) * 100).round(2)
      if @group_order.update(percentage_discount: percentage)
        if percentage < 0
          redirect_to @group_order, notice: "Recargo calculado: #{percentage.abs}% (propina)"
        else
          redirect_to @group_order, notice: "Descuento calculado: #{percentage}%"
        end
      else
        redirect_to @group_order, alert: "No se pudo actualizar el descuento."
      end
    else
      redirect_to @group_order, alert: "El monto debe ser mayor a 0."
    end
  end

  def update_bank_account
    if @group_order.update(bank_account: params[:group_order][:bank_account])
      redirect_to @group_order, notice: "Cuenta bancaria actualizada."
    else
      redirect_to @group_order, alert: "No se pudo actualizar la cuenta bancaria."
    end
  end

  def destroy
    @group_order.destroy
    redirect_to group_orders_path, notice: "Pedido grupal eliminado."
  end

  private

  def set_group_order
    @group_order = GroupOrder.find(params[:id])
  end

  def group_order_params
    params.require(:group_order).permit(:date, :restaurant_id, :percentage_discount)
  end
end
