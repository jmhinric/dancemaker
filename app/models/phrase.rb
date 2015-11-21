class Phrase
  include ActiveModel::Model
  attr_accessor :name, :movement_vocabulary, :num_measures, :beats_per_measure, :measures

  DEFAULT_NUM_MEASURES = 4
  DEFAULT_BEATS_PER_MEASURE = 8

  # @attribute name [String]
  # @attribute movement_vocabulary [MovementVocabulary]
  # @attribute num_measures [Integer]
  # @attribute beats_per_measure [Integer]

  def initialize(**args)
    super
    @measures = []

    num_measures.times { make_measure }
  end

  private

  def make_measure
    measure = []
    beats_per_measure.times { measure << beat }
    measures << measure
  end

  def beat
    movement_vocabulary.movement_string
  end
end
