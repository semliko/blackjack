class Round
  attr_reader :player, :dealer, :players, :state, :winner, :deck

  def initialize(player, dealer, deck)
    @player = player
    @dealer = dealer
    @deck = deck
    @players = [@player, @dealer]
  end

  def start
    2.times { deal_card_to_player }
    2.times { deal_card_to_dealer }
    place_bet
  end

  def player_turn
    deal_card_to_player
  end

  def dealer_turn
    deal_card_to_dealer if @dealer.cards_value < 17
  end

  def deal_card(current_player)
    current_player.get_cards(deck.deal_cards(1))
  end

  def winners
    new_winners = @players.select { |p| p.cards_value <= 21 }.max_by(&:cards_value)
    if (@dealer.cards_value == @player.cards_value) || !new_winners
      @players
    else
      [new_winners]
    end
  end

  def losers
    [@player, @dealer] - winners
  end

  def round_finished?
    players.all? { |p| p.cards.length >= 3 } || (dealer_is_full && player_is_full)
  end

  def discard_players_cards
    players.each(&:discard_cards)
  end

  def dealer_is_full
    dealer.cards_value >= 17
  end

  def player_is_full
    player.cards.length >= 3
  end
end
