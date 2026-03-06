class CreateIndividualOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :individual_orders do |t|
      t.references :group_order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :meal, null: false, foreign_key: true
      t.decimal :total, precision: 10, scale: 2

      t.timestamps
    end

    add_index :individual_orders, [:group_order_id, :user_id], unique: true
  end
end
