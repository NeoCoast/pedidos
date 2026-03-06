require 'rails_helper'

RSpec.describe GroupOrder, type: :model do
  describe "validations" do
    it { should validate_presence_of(:date) }
    it { should validate_presence_of(:status) }
    it { should validate_inclusion_of(:status).in_array(GroupOrder::STATUSES) }
  end

  describe "associations" do
    it { should belong_to(:restaurant) }
    it { should belong_to(:creator).class_name("User").with_foreign_key(:created_by_id) }
    it { should have_many(:individual_orders).dependent(:destroy) }
  end

  describe "status transitions" do
    it "does not allow going backward" do
      go = create(:group_order, status: "closed")
      go.status = "open"
      expect(go).not_to be_valid
      expect(go.errors[:status]).to include("can only advance forward")
    end

    it "allows advancing forward" do
      go = create(:group_order, status: "open")
      go.status = "closed"
      expect(go).to be_valid
    end

    it "does not allow skipping states" do
      go = create(:group_order, status: "open")
      go.status = "ordered"
      expect(go).not_to be_valid
      expect(go.errors[:status]).to include("can only advance forward")
    end
  end

  describe "#advance_status!" do
    it "moves from open to closed" do
      go = create(:group_order, status: "open")
      go.advance_status!
      expect(go.reload.status).to eq("closed")
    end

    it "moves from closed to ordered" do
      go = create(:group_order, status: "closed")
      go.advance_status!
      expect(go.reload.status).to eq("ordered")
    end

    it "moves from ordered to delivered" do
      go = create(:group_order, status: "ordered")
      go.advance_status!
      expect(go.reload.status).to eq("delivered")
    end

    it "returns false when already delivered" do
      go = create(:group_order, status: "delivered")
      expect(go.advance_status!).to be false
    end
  end

  describe "#grand_total" do
    it "sums individual order totals" do
      go = create(:group_order)
      restaurant = go.restaurant
      mi = create(:menu_item, restaurant: restaurant, price: 10.00)

      meal1 = create(:meal, menu_item: mi)
      meal2 = create(:meal, menu_item: mi)
      create(:individual_order, group_order: go, meal: meal1)
      create(:individual_order, group_order: go, meal: meal2)

      expect(go.grand_total).to eq(20.00)
    end
  end
end
