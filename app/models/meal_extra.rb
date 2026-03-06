class MealExtra < ApplicationRecord
  belongs_to :meal
  belongs_to :extra

  validates :extra_id, uniqueness: { scope: :meal_id }
end
