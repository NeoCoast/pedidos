FactoryBot.define do
  factory :topping do
    sequence(:name) { |n| "Topping #{n}" }
    price { 1.50 }
    menu_item
  end
end
