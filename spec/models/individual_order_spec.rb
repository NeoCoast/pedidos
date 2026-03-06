require 'rails_helper'

RSpec.describe IndividualOrder, type: :model do
  describe "associations" do
    it { should belong_to(:group_order) }
    it { should belong_to(:user) }
    it { should belong_to(:meal) }
  end

  describe "validations" do
    it "prevents duplicate user in same group order" do
      user = create(:user)
      go = create(:group_order)
      meal1 = create(:meal)
      meal2 = create(:meal)

      create(:individual_order, group_order: go, user: user, meal: meal1)
      duplicate = build(:individual_order, group_order: go, user: user, meal: meal2)

      expect(duplicate).not_to be_valid
      expect(duplicate.errors[:user_id]).to include("already has an order in this group")
    end

    it "requires group order to be open on create" do
      go = create(:group_order, status: "closed")
      io = build(:individual_order, group_order: go)

      expect(io).not_to be_valid
      expect(io.errors[:group_order]).to include("must be open to add orders")
    end

    it "allows creating when group order is open" do
      go = create(:group_order, status: "open")
      io = build(:individual_order, group_order: go)

      expect(io).to be_valid
    end
  end

  describe "total calculation" do
    it "calculates total before save" do
      menu_item = create(:menu_item, price: 10.00)
      topping = create(:topping, menu_item: menu_item, price: 1.50)
      extra = create(:extra, menu_item: menu_item, price: 2.00)

      meal = create(:meal, menu_item: menu_item)
      meal.toppings << topping
      meal.extras << extra

      io = create(:individual_order, meal: meal)
      expect(io.total).to eq(13.50)
    end

    it "calculates total with no toppings/extras" do
      menu_item = create(:menu_item, price: 8.00)
      meal = create(:meal, menu_item: menu_item)
      io = create(:individual_order, meal: meal)

      expect(io.total).to eq(8.00)
    end
  end
end
