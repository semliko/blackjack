class Deck
  attr_accessor :cards, :dealed_cards, :discarded_cards

  SUITS = %w[<3 + ^ <>]
  RANKS = %w[A two three four five six seven eight nine ten J Q K]

  def initialize
    @dealed_cards = []
    @cards = []
    @discarded_cards = []
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

  def deal_cards(number_of_cards)
    @dealed_cards += @cards.pop(number_of_cards)
  end

  def generate_cards
    build_cards.each { |c| @cards << Card.new(c) } if cards.empty?
  end

  def shuffle!
    @cards = @cards.shuffle
  end

  def discard_cards(*cards_to_discar)
    @cards -= cards_to_discar
    cards_to_discar.each { |c| @discarded_cards << c }
  end
end
