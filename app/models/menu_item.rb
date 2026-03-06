class MenuItem < ApplicationRecord
  belongs_to :restaurant
  has_many :toppings, dependent: :destroy
  has_many :extras, dependent: :destroy

  validates :name, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
