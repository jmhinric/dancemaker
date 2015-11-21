require "rails_helper"

RSpec.describe Movement do
  it { should validate_presence_of :name }
  it { should validate_presence_of :weight }


  let(:name) { Faker::Name.name }
  let(:weight) { Faker::Number.number(2) }
  let(:movement) { described_class.new(name: name, weight: weight) }

  describe "#initialize" do
    it "sets its properties" do
      expect(movement.name).to eq(name)
      expect(movement.weight).to eq(weight)
    end
  end
end
