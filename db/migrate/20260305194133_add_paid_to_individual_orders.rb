class AddPaidToIndividualOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :individual_orders, :paid, :boolean, default: false, null: false
  end
end
