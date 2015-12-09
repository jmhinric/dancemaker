require "rails_helper"

RSpec.describe Phrase do
  let(:name) { Faker::Name.name }
  let(:movement_vocabulary) { build :movement_vocabulary }
  let(:num_measures) { 2 }
  let(:beats_per_measure) { (1..4).to_a.sample }
  let(:counts_per_beat) { (1..4).to_a.sample }

  let(:subject) do
    described_class.new(
      name: name,
      movement_vocabulary: movement_vocabulary,
      num_measures: num_measures,
      beats_per_measure: beats_per_measure,
      counts_per_beat: counts_per_beat
    )
  end

  describe "#initialize" do
    let(:args1) do
      {
        number: 1,
        beats_per_measure: beats_per_measure,
        movement_vocabulary: movement_vocabulary,
        counts_per_beat: counts_per_beat
      }
    end

    let(:args2) do
      {
        number: 2,
        beats_per_measure: beats_per_measure,
        movement_vocabulary: movement_vocabulary,
        counts_per_beat: counts_per_beat
      }
    end

    let(:measure1) { instance_double("Measure") }
    let(:measure2) { instance_double("Measure") }

    it "sets its properties" do
      expect(subject.name).to eq(name)
      expect(subject.movement_vocabulary).to eq(movement_vocabulary)
      expect(subject.num_measures).to eq(num_measures)
      expect(subject.beats_per_measure).to eq(beats_per_measure)
      expect(subject.counts_per_beat).to eq(counts_per_beat)
    end

    it "adds its measures" do
      expect(subject.measures.count).to eq(num_measures)
    end

    it "creates measures with the correct attributes" do
      expect(Measure).to receive(:new).with(args1) { measure1 }
      expect(Measure).to receive(:new).with(args2) { measure2 }

      expect(subject.measures).to eq([measure1, measure2])
    end
  end
end
