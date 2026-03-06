class OrderShare < ApplicationRecord
  belongs_to :individual_order
  belongs_to :user

  validates :user_id, uniqueness: { scope: :individual_order_id }
end
