FactoryBot.define do
  factory :restaurant do
   email { generate(:email) }
   name "Itlian Pizza Corner"
   phone "123456"
  end
end
