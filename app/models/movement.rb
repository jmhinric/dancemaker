class Movement
  include ActiveModel::Model
  attr_accessor :name, :weight

  validates :name, :weight, presence: true

  # @attribute name
  #   @return [String]
  # @attribute weight
  #   @return [Integer]
end
