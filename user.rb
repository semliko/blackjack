class User
  attr_accessor :name, :cards, :balance

  def initialize(args = {})
    @name = args[:name]
    @cards = []
    @balance = args[:balance] || 0
  end

  def get_cards(cards)
    cards.each { |c| @cards << c }
  end

  def add_balance(amount)
    @balance += amount
  end

  def remove_balance(amount)
    raise 'Emount is shoter then balance' if balance < amount

    @balance -= amount
  end

  def cards_value
    cards.map(&:value).inject(:+)
  end

  def show_cards
    cards.map(&:label)
  end

  def discard_cards
    @cards = []
  end
end
