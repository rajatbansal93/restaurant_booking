FactoryBot.define do
  factory :guest do
   email { generate(:email) }
   name "Guest"
  end
end
