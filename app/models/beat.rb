class Beat
  include ActiveModel::Model
  attr_accessor :number, :movement_vocabulary, :movements, :counts_per_beat

  # validates_inclusion_of :divisions, in: 1..4
  # validates :divisions, presence: true

  TWO_COUNT = [nil, nil, '+']
  THREE_COUNT = [nil, nil, '+', 'a']
  FOUR_COUNT = [nil, nil, 'e', '+', 'u']

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
  end

  def add_counts
    counts_per_beat.times { add_count }
    self
  end

  def add_count
    movements << movement
  end

  def label(count_number, measure_number)
    return sublabel(count_number) if number != 1 || count_number != 1
    number == 1 ? measure_number : number
  end

  private

  def sublabel(count_number)
    COUNT_LABEL[counts_per_beat][count_number] || number
  end

  def movement
    return "" if should_pause?
    movement_vocabulary.movement_string
  end

  def should_pause?
    (0..100).to_a.sample < 25
  end
end
