class IndividualOrder < ApplicationRecord
  belongs_to :group_order
  belongs_to :user
  belongs_to :meal, dependent: :destroy
  has_many :order_shares, dependent: :destroy
  has_many :shared_users, through: :order_shares, source: :user

  validates :user_id, uniqueness: { scope: :group_order_id, message: "already has an order in this group" }
  validate :group_order_must_be_open, on: :create

  before_save :calculate_total

  def share_count
    1 + order_shares.size
  end

  def shared?
    order_shares.any?
  end

  def per_person_total
    total.to_f / share_count
  end

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
