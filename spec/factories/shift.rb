FactoryBot.define do
  factory :shift do
    name "morning"
    opening_time { "9 AM" }
    closing_time { "12 PM" }

    association :restaurant, factory: :restaurant
  end
end
