class User < ApplicationRecord
  has_many :individual_orders, dependent: :destroy
  has_many :group_orders, foreign_key: :created_by_id, dependent: :nullify, inverse_of: :creator

  validates :first_name, presence: true
  validates :last_name, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_name
    nickname.presence || full_name
  end
end
