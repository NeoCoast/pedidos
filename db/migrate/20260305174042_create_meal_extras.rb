class CreateMealExtras < ActiveRecord::Migration[8.1]
  def change
    create_table :meal_extras do |t|
      t.references :meal, null: false, foreign_key: true
      t.references :extra, null: false, foreign_key: true

      t.timestamps
    end

    add_index :meal_extras, [:meal_id, :extra_id], unique: true
  end
end
