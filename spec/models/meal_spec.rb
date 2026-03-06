require 'rails_helper'

RSpec.describe Meal, type: :model do
  describe "associations" do
    it { should belong_to(:menu_item) }
    it { should have_many(:meal_toppings).dependent(:destroy) }
    it { should have_many(:toppings).through(:meal_toppings) }
    it { should have_many(:meal_extras).dependent(:destroy) }
    it { should have_many(:extras).through(:meal_extras) }
  end

  describe "validations" do
    it "requires toppings to belong to the same menu item" do
      menu_item = create(:menu_item)
      other_menu_item = create(:menu_item)
      wrong_topping = create(:topping, menu_item: other_menu_item)

      meal = build(:meal, menu_item: menu_item)
      meal.toppings << wrong_topping
      expect(meal).not_to be_valid
      expect(meal.errors[:toppings]).to include("must belong to the same menu item")
    end

    it "requires extras to belong to the same menu item" do
      menu_item = create(:menu_item)
      other_menu_item = create(:menu_item)
      wrong_extra = create(:extra, menu_item: other_menu_item)

      meal = build(:meal, menu_item: menu_item)
      meal.extras << wrong_extra
      expect(meal).not_to be_valid
      expect(meal.errors[:extras]).to include("must belong to the same menu item")
    end

    it "allows toppings from the same menu item" do
      menu_item = create(:menu_item)
      topping = create(:topping, menu_item: menu_item)

      meal = build(:meal, menu_item: menu_item)
      meal.toppings << topping
      expect(meal).to be_valid
    end
  end

  describe "#calculated_total" do
    it "sums menu item price plus toppings and extras" do
      menu_item = create(:menu_item, price: 10.00)
      topping = create(:topping, menu_item: menu_item, price: 1.50)
      extra = create(:extra, menu_item: menu_item, price: 2.00)

      meal = create(:meal, menu_item: menu_item)
      meal.toppings << topping
      meal.extras << extra

      expect(meal.calculated_total).to eq(13.50)
    end

    it "returns just menu item price when no toppings/extras" do
      menu_item = create(:menu_item, price: 10.00)
      meal = create(:meal, menu_item: menu_item)

      expect(meal.calculated_total).to eq(10.00)
    end
  end
end
