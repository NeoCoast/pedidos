require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe "associations" do
    it { should have_many(:individual_orders).dependent(:destroy) }
    it { should have_many(:group_orders).with_foreign_key(:created_by_id).dependent(:nullify) }
  end

  describe "#full_name" do
    it "returns first and last name combined" do
      user = build(:user, first_name: "John", last_name: "Doe")
      expect(user.full_name).to eq("John Doe")
    end
  end
end
