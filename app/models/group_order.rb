class GroupOrder < ApplicationRecord
  STATUSES = %w[open closed ordered delivered].freeze

  belongs_to :restaurant
  belongs_to :creator, class_name: "User", foreign_key: :created_by_id, inverse_of: :group_orders
  has_many :individual_orders, dependent: :destroy

  validates :date, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }
  validates :percentage_discount, numericality: { less_than_or_equal_to: 100 }, allow_nil: true
  validate :status_can_only_move_one_step, if: :status_changed?

  def advance_status!
    current_index = STATUSES.index(status)
    return false if current_index.nil? || current_index >= STATUSES.length - 1

    update!(status: STATUSES[current_index + 1])
  end

  def revert_status!
    current_index = STATUSES.index(status)
    return false if current_index.nil? || current_index <= 0

    update!(status: STATUSES[current_index - 1])
  end

  def grand_total
    individual_orders.sum(:total)
  end

  def discounted_total
    total = grand_total
    discount = percentage_discount.to_f
    discount != 0 ? total * (1 - discount / 100) : total
  end

  private

  def status_can_only_move_one_step
    return if status_was.nil?

    old_index = STATUSES.index(status_was)
    new_index = STATUSES.index(status)
    return if old_index.nil? || new_index.nil?

    unless (new_index - old_index).abs == 1
      errors.add(:status, "can only move one step at a time")
    end
  end
end
