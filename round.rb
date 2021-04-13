class Round
  attr_reader :player, :dealer, :players, :winner, :deck, :show_cards, :finish_game

  def initialize(player, dealer, deck)
    @player = player
    @dealer = dealer
    @deck = deck
    @players = [@player, @dealer]
  end

  def start
    2.times { deal_card_to_player }
    2.times { deal_card_to_dealer }
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

  def deal_card_to_player
    deal_card(player)
  end

  def deal_card_to_dealer
    deal_card(dealer)
  end

  def exec_user_choice(user_input)
    case user_input
    when 1
      dealer_turn
    when 2
      player_turn
      dealer_turn
    when 3
      compleate_round
    when 0
      end_game
    end
  end

  def end_game
    @show_cards = true
    @finish_game = true
  end

  def compleate_round
    @show_cards = true
  end

  def winners
    new_winners = @players.select { |p| p.cards_value.to_i <= 21 }.max_by(&:cards_value)
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
    players.all? { |p| p.cards.length >= 3 } || (dealer_is_full && player_is_full) || show_cards
  end

  def dealer_is_full
    dealer.cards_value >= 17
  end

  def player_is_full
    player.cards.length >= 3
  end
end
