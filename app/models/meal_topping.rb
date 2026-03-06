class MealTopping < ApplicationRecord
  belongs_to :meal
  belongs_to :topping

  validates :topping_id, uniqueness: { scope: :meal_id }
end
