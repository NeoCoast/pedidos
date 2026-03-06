require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  describe "validations" do
    subject { build(:restaurant) }

    it { should validate_presence_of(:name) }
    it { should validate_uniqueness_of(:name) }
  end

  describe "associations" do
    it { should have_many(:menu_items).dependent(:destroy) }
    it { should have_many(:group_orders).dependent(:restrict_with_error) }
  end
end
