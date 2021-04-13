class Deck
  attr_accessor :cards, :dealed_cards, :discarded_cards

  SUITS = %w[♠ ♥ ♣ ♦].freeze
  RANKS = %w[2 3 4 5 6 7 8 9 10 J Q K A].freeze

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
        new_card = { suit: suit, rank: rank, value: card_value, label: (rank + suit) }
        new_cards << new_card
      end
    end
    new_cards
  end

  def deal_cards(number_of_cards)
    generate_cards if @cards.empty?
    shuffle!
    withraw_cards = @cards.pop(number_of_cards)
    @dealed_cards += withraw_cards
    withraw_cards
  end

  def generate_cards
    build_cards.each { |c| @cards << Card.new(c) } if cards.empty?
  end

  def shuffle!
    @cards = @cards.shuffle
  end

  def discard_cards
    @dealed_cards.each { |c| @discarded_cards << c }
    @dealed_cards = []
  end
end
