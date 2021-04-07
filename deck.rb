class Deck
  attr_accessor :cards

  SUITS = %w[<3 + ^ <>]
  RANKS = %w[A two three four five six seven eight nine ten J Q K]

  def initialize
    @cards = []
    generate_cards
  end

  def build_cards
    new_cards = []
    values = [11, 2, 3, 4, 5, 6, 7, 8, 9, 10, 10, 10, 10]
    SUITS.each do |suit|
      RANKS.each_with_index do |rank, index|
        card_value = values[index]
        new_card = { suit: suit, rank: rank, value: card_value, lable: (rank + suit) }
        new_cards << new_card
      end
    end
    new_cards
  end

  def withdraw_cards(number_of_cards)
    @cards.pop(number_of_cards)
  end

  def generate_cards
    build_cards.each { |c| @cards << Card.new(c) } if cards.empty?
  end

  def shuffle!
    @cards = @cards.shuffle
  end
end
