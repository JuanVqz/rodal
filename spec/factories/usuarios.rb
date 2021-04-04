FactoryBot.define do
  factory :usuario do
    username { "Mateo" }
    sequence(:email) { |n| "mateo#{n}@gmail.com" }
    password { "123456" }
  end
end
