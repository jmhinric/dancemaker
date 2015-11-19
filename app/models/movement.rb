class Movement
  attr_accessor :name, :weight

  # @attribute name [String]
  # @attribute weight [Integer]
  def initialize(name:, weight:)
    @name = name
    @weight = weight
  end
end
