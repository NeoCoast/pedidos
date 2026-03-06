class Meal < ApplicationRecord
  belongs_to :menu_item
  has_many :meal_toppings, dependent: :destroy
  has_many :toppings, through: :meal_toppings
  has_many :meal_extras, dependent: :destroy
  has_many :extras, through: :meal_extras

  validate :toppings_belong_to_menu_item
  validate :extras_belong_to_menu_item

  def calculated_total
    menu_item.price + toppings.sum(:price) + extras.sum(:price)
  end

  private

  def toppings_belong_to_menu_item
    toppings.each do |topping|
      if topping.menu_item_id != menu_item_id
        errors.add(:toppings, "must belong to the same menu item")
        break
      end
    end
  end

  def extras_belong_to_menu_item
    extras.each do |extra|
      if extra.menu_item_id != menu_item_id
        errors.add(:extras, "must belong to the same menu item")
        break
      end
    end
  end
end
