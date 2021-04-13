Dir['./*.rb'].each do |file|
  require file unless ['./main.rb'].include?(file)
end

game = BlackJackGame.new
game.start_game
