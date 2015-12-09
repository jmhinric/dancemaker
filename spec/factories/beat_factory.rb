FactoryGirl.define do
  factory :beat, class: Beat do
    number { (1..8).to_a.sample }
    movement_vocabulary { build :movement_vocabulary }
    counts_per_beat { (1..4).to_a.sample }

    initialize_with { new(attributes) }
  end
end
