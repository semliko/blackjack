class User
  attr_accessor :name, :cards

  def initialize(name)
    @name = name
    @cards = []
  end

  def get_cards(cards)
    cards.each { |c| @cards << c }
  end
end
