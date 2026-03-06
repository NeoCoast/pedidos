class CreateToppings < ActiveRecord::Migration[8.1]
  def change
    create_table :toppings do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
