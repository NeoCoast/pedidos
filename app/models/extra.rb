class Extra < ApplicationRecord
  belongs_to :menu_item

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
