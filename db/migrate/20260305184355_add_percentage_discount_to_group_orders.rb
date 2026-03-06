class AddPercentageDiscountToGroupOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :group_orders, :percentage_discount, :decimal, precision: 5, scale: 2, default: 0
  end
end
