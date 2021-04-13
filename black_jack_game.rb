require_relative 'interface'

class BlackJackGame
  attr_reader :dealer, :deck, :player, :bank, :keep_playing, :players, :rounds

  DEFAULT_BALANCE = 100

  def initialize(player_name = request_player_name)
    create_player(player_name)
    create_dealer
    create_deck
    @bank = 0
    @players = [@player, @dealer]
    @rounds = []
  end

  def request_player_name
    Interface.request_player_name
  end

  def start_game
    @keep_playing = true
    @player.add_balance(DEFAULT_BALANCE)
    @dealer.add_balance(DEFAULT_BALANCE)
    continue_game
  end

  def continue_game
    play_game while players_have_money && keep_playing
    end_game unless players_have_money
  end

  def play_game
    start_round
    place_bet
    play_round until current_round.round_finished?
    current_round.finish_game ? end_game : finalize_round
  end

  def start_round
    round = Round.new(player, dealer, deck)
    @rounds << round
    round.start
  end

  def play_round
    Interface.print_player_cards(player)
    Interface.print_game_menu
    user_input = Interface.user_input
    current_round.exec_user_choice(user_input)
  end

  def finalize_round
    bank_bet_money
    print_round_summary
    discard_players_cards
  end

  def print_round_summary
    Interface.print_winners(current_round.winners)
    Interface.print_losers(current_round.losers)
    Interface.print_balance(players)
  end

  def current_round
    @rounds.last
  end

  def start_new_round
    round = Rourn, new(player, dealer, deck)
    round.start
    place_bet
  end

  def players_have_money
    players.all? { |p| p.balance.positive? }
  end

  def discard_players_cards
    players.each(&:discard_cards)
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
    winners = current_round.winners
    won_amount = @bank / winners.length
    winners.each { |w| w.add_balance(won_amount) }
    @bank = 0
  end

  def end_game(user_input = {})
    user_choice = user_input[:user_input] || Interface.print_end_game_menu
    case user_choice
    when 'Y'
      start_game
    else
      @keep_playing = false
      Interface.print_game_over
    end
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
    current_rount.finished?
  end
end
