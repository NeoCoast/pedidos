FactoryBot.define do
  factory :extra do
    sequence(:name) { |n| "Extra #{n}" }
    price { 2.00 }
    menu_item
  end
end
