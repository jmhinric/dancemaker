class Maker
  attr_accessor :movements, :qualities, :duration, :weights, :phrases

  NUM_TIMES = [
    "",
    "twice",
    "thrice"
  ]

  def initialize(attrs)
    self.movements = attrs[:moves]
    self.weights = {}
    set_movement_probabilities
    self.qualities = attrs[:qualities]
    self.duration = attrs[:duration] || 4
    @phrases = []

    make_dance
  end

  def make_dance
    duration.times { |_n| make_moves }
  end

  def make_moves
    phrase = []
    8.times { phrase << movement + times_repeated + movement_quality }
    phrases << phrase
  end

  def movement
    weights[weight]
  end

  def weight
    weight_keys.select { |weight| (1..100).to_a.sample <= weight }.first.to_s
  end

  def weight_keys
    weights.keys.map(&:to_i).sort
  end

  def times_repeated
    repeat = NUM_TIMES.sample
    repeat.empty? ? repeat : " " + repeat
  end

  def movement_quality
    " " + qualities.sample
  end

  def set_movement_probabilities
    total = 0
    movements.each do |move|
      weight = move[:weight]
      total += weight
      weights[total.to_s] = move[:name]
    end

    raise "Probabilities don't total 100" if total != 100
  end
end
