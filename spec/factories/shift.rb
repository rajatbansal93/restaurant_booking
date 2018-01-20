FactoryBot.define do
  factory :shift do
    name "morning"
    opening_time Time.current - 3.hours
    closing_time  Time.current + 3.hours

  association :restaurant, factory: :restaurant
  end
end
