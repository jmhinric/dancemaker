class MovementVocabulary
  include ActiveModel::Model
  attr_accessor :name, :movements, :qualities, :movement_weights

  validates :name, :movements, :qualities, presence: true

  NUM_TIMES = [
    "",
    "twice",
    "three times"
  ]

  # @attribute name
  #   @return [String]
  # @attribute movements
  #   @return [Array<Movement>]
  # @attribute qualities
  #   @return [Array<String>]

  def initialize(**args)
    super
    @movement_weights = {}
    set_movement_probabilities
  end

  def generate_movement
    pause? ? "" : movement_string
  end

  def movement_string
    repeat = times_repeated
    movement + space(repeat) + repeat + " " + quality
  end

  def movement
    movement_weights[weight]
  end

  private

  def pause?
    (0..100).to_a.sample < 25
  end

  def times_repeated
    NUM_TIMES.sample
  end

  def quality
    qualities.sample
  end

  def space(repeat)
    repeat.empty? ? "" : " "
  end

  def weight
    weight_keys.select { |weight| (1..100).to_a.sample <= weight }.first.to_s
  end

  def weight_keys
    movement_weights.keys.map(&:to_i).sort
  end

  def set_movement_probabilities
    total = 0
    movements.each do |movement|
      weight = movement.weight
      total += weight
      movement_weights[total.to_s] = movement.name
    end

    raise "Probabilities don't total 100" if total != 100
  end
end
