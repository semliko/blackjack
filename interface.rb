module Interface
  module_function

  def print_game_menu
    puts '[1] To pass press 1'
    puts '[2] To get one more card press 2'
    puts '[3] To open cards press 3'
    puts '[0] To exit game press 0'

    # user_input = gets.chomp.to_i
    # game.menu(user_input)
  end

  def user_input
    gets.chomp.to_i
  end

  def request_player_name
    puts 'Enter Player name'
    gets.chomp
  end

  def menu(user_input)
    @user_input = user_input
    menu_choices
    compleate_round if round_finished?
  end

  # def exec_user_choice(user_input)
  #  case user_input
  #  when 1
  #    dealer_turn
  #  when 2
  #    player_turn
  #    dealer_turn
  #  when 3
  #    compleate_round
  #  when 0
  #    end_game
  #  end
  # end

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
