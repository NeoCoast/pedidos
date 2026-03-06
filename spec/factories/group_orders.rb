FactoryBot.define do
  factory :group_order do
    date { Date.today }
    restaurant
    status { "open" }
    association :creator, factory: :user
  end
end
