require "rails_helper"

RSpec.describe Measure do
  let(:number) { Faker::Number.number(1).to_i }
  let(:movement_vocabulary) { build :movement_vocabulary }
  let(:counts_per_beat) { Faker::Number.number(1).to_i }
  let(:beats_per_measure) { 2 }

  let(:subject) do
    described_class.new(
      number: number,
      movement_vocabulary: movement_vocabulary,
      counts_per_beat: counts_per_beat,
      beats_per_measure: beats_per_measure
    )
  end

  describe "#initialize" do
    let(:args1) do
      {
        number: 1,
        movement_vocabulary: movement_vocabulary,
        counts_per_beat: counts_per_beat
      }
    end

    let(:args2) do
      {
        number: 2,
        movement_vocabulary: movement_vocabulary,
        counts_per_beat: counts_per_beat
      }
    end

    let(:beat1) { instance_double("Beat") }
    let(:beat2) { instance_double("Beat") }

    it "sets its properties" do
      expect(subject.number).to eq(number)
      expect(subject.movement_vocabulary).to eq(movement_vocabulary)
      expect(subject.counts_per_beat).to eq(counts_per_beat)
      expect(subject.beats_per_measure).to eq(beats_per_measure)
    end

    it "adds its beats" do
      expect(subject.beats.count).to eq(beats_per_measure)
    end

    it "creates beats with the correct attributes" do
      expect(Beat).to receive(:new).with(args1) { beat1 }
      expect(Beat).to receive(:new).with(args2) { beat2 }

      expect(subject.beats).to eq([beat1, beat2])
    end
  end
end
