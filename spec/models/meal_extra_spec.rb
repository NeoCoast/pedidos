require 'rails_helper'

RSpec.describe MealExtra, type: :model do
  describe "associations" do
    it { should belong_to(:meal) }
    it { should belong_to(:extra) }
  end

  describe "validations" do
    subject { create(:meal_extra) }
    it { should validate_uniqueness_of(:extra_id).scoped_to(:meal_id) }
  end
end
