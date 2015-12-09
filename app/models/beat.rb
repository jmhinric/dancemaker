class Beat
  include ActiveModel::Model
  attr_accessor :number, :movement_vocabulary, :counts_per_beat, :movements

  TWO_COUNT = [nil, nil, '+']
  THREE_COUNT = [nil, nil, '+', 'a']
  FOUR_COUNT = [nil, nil, 'e', '+', 'a']

  COUNT_LABEL = [nil, [], TWO_COUNT, THREE_COUNT, FOUR_COUNT]

  # @attribute number
  #   @return [Integer]
  # @attribute movement_vocabulary
  #   @return [MovementVocabulary]
  # @attribute counts_per_beat
  #   @return [Integer]

  def initialize(**args)
    super
    @movements = []

    add_counts
  end

  def label(count_number, measure_number)
    if not_first_count_or_measure?(count_number)
      sublabel(count_number) || number 
    else
      measure_number
    end
  end

  private

  def add_counts
    counts_per_beat.times do
      movements << movement_vocabulary.generate_movement
    end
  end

  def not_first_count_or_measure?(count_number)
    number != 1 || count_number != 1
  end

  def sublabel(count_number)
    COUNT_LABEL[counts_per_beat][count_number]
  end
end
