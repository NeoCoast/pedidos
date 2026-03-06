class Restaurant < ApplicationRecord
  has_many :menu_items, dependent: :destroy
  has_many :group_orders, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
end
