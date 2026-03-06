class CreateGroupOrders < ActiveRecord::Migration[8.1]
  def change
    create_table :group_orders do |t|
      t.date :date
      t.references :restaurant, null: false, foreign_key: true
      t.string :status
      t.references :created_by, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
