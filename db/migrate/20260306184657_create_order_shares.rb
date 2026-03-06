class CreateOrderShares < ActiveRecord::Migration[8.1]
  def change
    create_table :order_shares do |t|
      t.references :individual_order, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.boolean :paid, default: false, null: false

      t.timestamps
    end

    add_index :order_shares, [:individual_order_id, :user_id], unique: true
  end
end
