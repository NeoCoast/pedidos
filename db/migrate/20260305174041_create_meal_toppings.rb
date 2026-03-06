class CreateMealToppings < ActiveRecord::Migration[8.1]
  def change
    create_table :meal_toppings do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :topping, null: false, foreign_key: true

      t.timestamps
    end

    add_index :meal_toppings, [:meal_id, :topping_id], unique: true
  end
end
