class Measure
  include ActiveModel::Model
  attr_accessor :number, :beats, :beats_per_measure, :movement_vocabulary, :counts_per_beat
  # :next_measure

  # Once this is an ActiveRecord model, use the enum of Rails
  # enum type: [:simple, :complex]

  # @attribute number
  #   @return [Integer]
  # @attribute movement_vocabulary
  #   @return [MovementVocabulary]
  # @attribute counts_per_beat
  #   @return [Integer]
  # @attribute beats_per_measure
  #   @return [Integer]

  def initialize(**args)
    super
    self.beats = []
  end

  def add_beats
    beats_per_measure.times { |beat_num| add_beat(beat_num + 1) }
    self
  end

  def add_beat(beat_num)
    beats << Beat.new(
               number: beat_num,
               movement_vocabulary: movement_vocabulary,
               counts_per_beat: counts_per_beat
             ).add_counts
  end
end
