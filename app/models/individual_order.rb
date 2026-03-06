class IndividualOrder < ApplicationRecord
  belongs_to :group_order
  belongs_to :user
  belongs_to :meal, dependent: :destroy

  validates :user_id, uniqueness: { scope: :group_order_id, message: "already has an order in this group" }
  validate :group_order_must_be_open, on: :create

  before_save :calculate_total

  private

  def group_order_must_be_open
    if group_order && group_order.status != "open"
      errors.add(:group_order, "must be open to add orders")
    end
  end

  def calculate_total
    self.total = meal.calculated_total
  end
end
