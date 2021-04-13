module Interface
  module_function

  def print_game_menu
    puts '[1] To pass press 1'
    puts '[2] To get one more card press 2'
    puts '[3] To open cards press 3'
    puts '[0] To exit game press 0'
  end

  def user_input
    gets.chomp.to_i
  end

  def request_player_name
    puts 'Enter Player name'
    gets.chomp
  end

  def print_end_game_menu
    puts 'Do you want to play another game?'
    puts '[Y] type Y to play'
    puts '[N] type N to finish'
    gets.chomp
  end

  def print_game_over
    puts 'Game Over'
  end

  def print_winners(winners)
    puts '=========== Winner is:=============== '
    winners.each do |w|
      puts w.name
      puts '====================='
      puts 'with cards:'
      puts w.show_cards
      puts "with total of #{w.cards_value}"
    end
  end

  def print_losers(losers)
    puts '----------The loser is: ---------'
    losers.each do |l|
      puts l.name.to_s
      puts 'With cards'
      puts l.show_cards
      puts "With total of  #{l.cards_value}"
    end
  end

  def print_balance(players)
    puts '--------Current Balance is ------------'
    players.each do |p|
      puts "#{p.name} => #{p.balance}"
    end
  end

  def print_player_cards(player)
    puts '__________Your cards are:____________'
    puts player.show_cards
  end
end
