require "rails_helper"

RSpec.describe Beat do
  let(:number) { Faker::Number.number(1).to_i }
  let(:movement_vocabulary) { build :movement_vocabulary }
  let(:counts_per_beat) { Faker::Number.number(1).to_i }
  let(:subject) do
    described_class.new(
      number: number,
      movement_vocabulary: movement_vocabulary,
      counts_per_beat: counts_per_beat
    )
  end

  describe "#initialize" do
    it "sets its attributes" do
      expect(subject.number).to eq(number)
      expect(subject.movement_vocabulary).to eq(movement_vocabulary)
      expect(subject.counts_per_beat).to eq(counts_per_beat)
    end
  end

  describe "#add_counts" do
    it "sets the movements for each of the beat's counts" do
      expect(movement_vocabulary).to receive(:generate_movement).exactly(counts_per_beat).times
      subject.add_counts
      expect(subject.movements.count).to eq(counts_per_beat)
    end
  end

  describe "#label" do
    let(:subject) { build :beat, number: number, counts_per_beat: 3 }
    let(:result) { subject.label(count_number, measure_number) }
    let(:number) { 1 }
    let(:count_number) { 1 }
    let(:measure_number) { 1 }

    context "first count of first beat" do
      context "of first measure" do
        let(:measure_number) { 1 }

        it "returns the measure number" do
          expect(result).to eq(measure_number)
        end
      end

      context "of not first measure" do
        let(:measure_number) { 3 }

        it "returns the measure number" do
          expect(result).to eq(measure_number)
        end
      end
    end

    context "first count of not first beat" do
      let(:number) { 2 }

      it "returns the beat number" do
        expect(result).to eq(number)
      end
    end

    context "not first count" do
      let(:measure_number) { (1..8).to_a.sample }

      context "two counts per beat" do
        let(:subject) { build :beat, number: number, counts_per_beat: 2 }

        it "gives the correct label for count 2" do
          expect(subject.label(2, measure_number)).to eq("+")
        end
      end

      context "three counts per beat" do
        let(:subject) { build :beat, number: number, counts_per_beat: 3 }

        it "gives the correct label for count 2" do
          expect(subject.label(2, measure_number)).to eq("+")
        end

        it "gives the correct label for count 3" do
          expect(subject.label(3, measure_number)).to eq("a")
        end
      end

      context "four counts per beat" do
        let(:subject) { build :beat, number: number, counts_per_beat: 4 }

        it "gives the correct label for count 2" do
          expect(subject.label(2, measure_number)).to eq("e")
        end

        it "gives the correct label for count 3" do
          expect(subject.label(3, measure_number)).to eq("+")
        end

        it "gives the correct label for count 4" do
          expect(subject.label(4, measure_number)).to eq("a")
        end
      end
    end
  end
end
