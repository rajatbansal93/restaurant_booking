FactoryBot.define do
  factory :table do
    name "morning"
    min_guest 1
    max_guest 5

  association :restaurant, factory: :restaurant
  end
end
