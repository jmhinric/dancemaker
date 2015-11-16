class Beat
  include ActiveModel::Model
  attr_accessor :type

  validates_inclusion_of :type, in: 0..4

  def initialize(type:)
    @type = type
  end
end
