require 'pry'

Dir['./*.rb'].each do |file|
  require file unless file == './main.rb'
end

puts 'Enter Player name'
player_name = gets.chomp
game = BlackJackGame.new(player_name)
game.start_game

while game.keep_playing
  game.print_player_cards
  puts '[1] To pass press 1'
  puts '[2] To get one more card press 2'
  puts '[3] To open cards press 3'
  puts '[0] To exit game press 0'

  user_input = gets.chomp.to_i
  game.menu(user_input)
end
