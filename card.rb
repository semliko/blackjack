class Card
  attr_reader :suit, :rank, :value, :lable

  def initialize(args)
    @suit = args[:suit]
    @rank = args[:rank]
    @value = args[:value]
    @lable = args[:lable]
  end
end
