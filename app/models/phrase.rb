class Phrase
  include ActiveModel::Model
  attr_accessor :name, :movement_vocabulary, :num_measures, :beats_per_measure, :counts_per_beat, :measures

  DEFAULT_NUM_MEASURES = 4
  DEFAULT_BEATS_PER_MEASURE = 8

  # @attribute name
  #   @return [String]
  # @attribute movement_vocabulary
  #   @return [MovementVocabulary]
  # @attribute num_measures
  #   @return [Integer]
  # @attribute beats_per_measure
  #   @return [Integer]
  # @attribute counts_per_beat
  #   @return [Integer]

  def initialize(**args)
    super
    self.num_measures ||= DEFAULT_NUM_MEASURES
    self.beats_per_measure ||= DEFAULT_BEATS_PER_MEASURE
    self.measures = []

    add_measures
  end

  private

  def add_measures
    num_measures.times do |measure_num|
      measures << Measure.new(
                    number: measure_num + 1,
                    beats_per_measure: beats_per_measure,
                    movement_vocabulary: movement_vocabulary,
                    counts_per_beat: divisions
                  )
    end
  end

  def divisions
    @cpb ||= counts_per_beat || (1..4).to_a.sample
  end
end
