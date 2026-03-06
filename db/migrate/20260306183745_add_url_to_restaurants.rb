class AddUrlToRestaurants < ActiveRecord::Migration[8.1]
  def change
    add_column :restaurants, :url, :string
  end
end
