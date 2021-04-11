class BlackJackGame
  attr_reader :dealer, :deck, :player, :bank, :keep_playing, :players

  def initialize(player_name)
    create_player(player_name)
    create_dealer
    create_deck
    @bank = 0
    @keep_playing = true
    @players = [@player, @dealer]
  end

  def start_game
    @keep_playing = true
    @player.add_balance(100)
    @dealer.add_balance(100)
    start_new_round
  end

  def start_new_round
    puts 'New Round'
    2.times { deal_card_to_player }
    2.times { deal_card_to_dealer }
    place_bet
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

  def place_bet
    @players.each do |player|
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
    won_amount = @bank / winners.length
    winners.each { |w| w.add_balance(won_amount) }
    @bank = 0
  end

  def dealer_turn
    deal_card_to_dealer if @dealer.cards_value < 17
  end

  def player_turn
    deal_card_to_player
  end

  def end_game
    puts 'Do you want to play another game?'
    puts '[Y] type Y to play'
    puts '[N] type N to finish'
    user_input = gets.chomp

    case user_input
    when 'Y'
      start_game
    else
      @keep_playing = false
      puts 'Game over'
    end
    # @keep_playing = false
    # puts 'Game over'
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

  def create_player(name)
    @player = Player.new(name: name)
  end

  def create_dealer
    @dealer = Dealer.new(name: 'Dealer')
  end

  def create_deck
    @deck = Deck.new
  end

  def round_finished?
    players.all? { |p| p.cards.length >= 3 } || (dealer_is_full && player_is_full)
  end

  def discard_players_cards
    players.each(&:discard_cards)
  end

  def menu(user_input)
    @user_input = user_input
    menu_choices
    compleate_round if round_finished?
  end

  def menu_choices
    case @user_input
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

  def dealer_is_full
    dealer.cards_value >= 17
  end

  def player_is_full
    player.cards.length >= 3
  end

  def compleate_round
    bank_bet_money
    print_winners
    print_losers
    print_balance
    discard_players_cards
    start_new_round
  end

  def print_winners
    puts '=========== Winner is:=============== '
    winners.each do |w|
      puts w.name
      puts '====================='
      puts 'with cards:'
      puts w.show_cards
      puts "with total of #{w.cards_value}"
    end
  end

  def print_losers
    puts '----------The loser is: ---------'
    losers.each do |l|
      puts l.name.to_s
      puts 'With cards'
      puts l.show_cards
      puts "With total of  #{l.cards_value}"
    end
  end

  def print_balance
    puts '--------Current Balance is ------------'
    players.each do |p|
      puts "#{p.name} => #{p.balance}"
    end
  end

  def print_player_cards
    puts '__________Your cards are:____________'
    puts player.show_cards
  end
end
