require "rails_helper"

RSpec.describe Beat do
  
  it do
    should validate_inclusion_of(:type).in_array((0..4).to_a)
  end

  let(:type) { 0 }
  let(:subject) { described_class.new(type: type) }

  describe "#initialize" do
    it "has a type" do
      expect(subject.type).to eq(type)
    end
  end
end
