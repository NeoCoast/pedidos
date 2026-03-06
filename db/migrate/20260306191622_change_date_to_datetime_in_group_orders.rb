class ChangeDateToDatetimeInGroupOrders < ActiveRecord::Migration[8.1]
  def change
    change_column :group_orders, :date, :datetime
  end
end
