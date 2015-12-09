require "rails_helper"

RSpec.describe MovementVocabulary do
  it { should validate_presence_of :name }
  it { should validate_presence_of :movements }
  it { should validate_presence_of :qualities }


  let(:movement1) { build :movement, weight: 25 }
  let(:movement2) { build :movement, weight: 75 }
  let(:movements) { [movement1, movement2] }
  subject(:vocab) { described_class.new(movements: movements)}

  describe "#initialize" do
    it "is ok with valid movement weights" do
      expect(vocab).to be
    end

    it "raises an exception if movement weights don't total 100" do
      movement1.weight = 55
      expect { vocab }.to raise_error
    end
  end

  describe "#generate_movement" do
    let(:result) { subject.generate_movement }

    context "pause true" do
      before { allow(subject).to receive(:pause?) { true } }

      it "gives an empty string" do
        expect(result).to eq("")
      end
    end

    context "pause false" do
      before { allow(subject).to receive(:pause?) { false } }

      it "gives a movement string" do
        expect(subject).to receive(:movement_string)
        result
      end
    end
  end

  describe "#movement_string" do
    context "times repeated exists" do
      before do
        allow(vocab).to receive(:movement) { "tendu" }
        allow(vocab).to receive(:times_repeated) { "twice" }
        allow(vocab).to receive(:quality) { "quickly" }
      end

      it "returns a movement name, times to repeat, and quality" do
        expect(vocab.movement_string).to eq("tendu twice quickly")
      end
    end

    context "times repeated is blank" do
      before do
        allow(vocab).to receive(:movement) { "tendu" }
        allow(vocab).to receive(:times_repeated) { "" }
        allow(vocab).to receive(:quality) { "quickly" }
      end

      it "returns a movement name, times to repeat, and quality" do
        expect(vocab.movement_string).to eq("tendu quickly")
      end
    end
  end

  describe "#movement" do
    let(:names) { movements.map(&:name) }
    let(:result) { vocab.movement }

    it "returns the name of a randomly selected movement" do
      expect(names.include? result).to be(true)
    end
  end
end
