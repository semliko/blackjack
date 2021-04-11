class Card
  attr_reader :suit, :rank, :value, :label

  def initialize(args)
    @suit = args[:suit]
    @rank = args[:rank]
    @value = args[:value]
    @label = args[:label]
  end
end
