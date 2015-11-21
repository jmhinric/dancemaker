FactoryGirl.define do
  factory :movement, class: Movement do
    name { Faker::Lorem.word }
    weight { Faker::Number.number(2).to_i }
  end
end
