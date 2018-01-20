FactoryBot.define do
  factory :reservation do
    guest_count 2
    time { Time.current + 1.hour }
    shift "morning"

    association :table, factory: :table
    association :guest, factory: :guest
  end
end
