class BlackJackGame
  attr_reader :dealer, :deck, :player, :bank, :keep_playing

  def initialize(player_name)
    # @dealer = dealer
    # @deck = deck
    # @player = player
    create_player(player_name)
    create_dealer
    create_deck
    @bank = 0
    @keep_playing = true
  end

  def start_game
    @keep_playing = true
    @player.add_balance(100)
    @dealer.add_balance(100)
    player.get_cards(deck.deal_cards(2))
    dealer.get_cards(deck.deal_cards(2))
    place_bet
  end

  def deal_card_to_player
    player.get_cards(deck.deal_cards(1))
  end

  def deal_card_to_dealer
    dealer.get_cards(deck.deal_cards(1))
  end

  def place_bet
    [@player, @dealer].each do |player|
      player.remove_balance(10)
    rescue StandardError => e
      if e.message == 'Emount is shoter then balance'
        puts "Player #{player.name} has not enough money to place a bet"
        end_game
        break
      end
    end
    @bank += 20
  end

  def bank_bet_money
    winner = get_winner
    winner.add_balance(@bank)
    @bank = 0
  end

  def end_game
    @keep_playing = false
    puts 'Game over'
  end

  def get_winer
    [@dealer, @player].select { |p| p.cards_value <= 21 }
                      .max_by(&:cards_value).first
  end

  def create_player(name)
    @player = Player.new(name: name)
  end

  def create_dealer
    @dealer = Dealer.new(name: 'Dealer')
  end

  def create_deck
    @deck = Deck.new
  end
end
