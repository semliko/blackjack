class BlackJackGame
  attr_reader :dealer, :deck, :player

  def initialaze(dealer, deck, player)
    @dealer = dealer
    @deck = deck
    @player = player
    start_game
  end

  def start_game; end
end
