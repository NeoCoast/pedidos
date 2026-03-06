class AddBankAccountToGroupOrders < ActiveRecord::Migration[8.1]
  def change
    add_column :group_orders, :bank_account, :string
  end
end
