class CreateMeals < ActiveRecord::Migration[8.1]
  def change
    create_table :meals do |t|
      t.references :menu_item, null: false, foreign_key: true

      t.timestamps
    end
  end
end
