require 'rails_helper'

RSpec.describe MealTopping, type: :model do
  describe "associations" do
    it { should belong_to(:meal) }
    it { should belong_to(:topping) }
  end

  describe "validations" do
    subject { create(:meal_topping) }
    it { should validate_uniqueness_of(:topping_id).scoped_to(:meal_id) }
  end
end
