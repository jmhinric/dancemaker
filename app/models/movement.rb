class Movement
  include ActiveModel::Model
  attr_accessor :name, :weight

  validates :name, :weight, presence: true

  # @attribute name [String]
  # @attribute weight [Integer]
end
