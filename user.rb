class User
  attr_accessor :name, :cards, :balance

  def initialize(args)
    @name = args[:name]
    @cards = []
    @balance = args[:balance]
  end

  def get_cards(cards)
    cards.each { |c| @cards << c }
  end

  def add_balance(amount)
    @balance += amount
  end

  def remove_balance(amount)
    @balance -= amount
  end
end
