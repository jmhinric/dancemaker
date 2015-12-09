FactoryGirl.define do
  factory :movement_vocabulary, class: MovementVocabulary do
    name { Faker::Lorem.word }
    movements { [build(:movement, weight: 75), build(:movement, weight: 25)] }
    qualities { (0..2).to_a.map { Faker::Lorem.word } }

    initialize_with { new(attributes) }
  end
end
