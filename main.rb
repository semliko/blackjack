require 'pry'

Dir['./*.rb'].each do |file|
  require file unless file == './main.rb'
end

puts 'Enter Player name'

# player_name = gets.chomp
#
# player = Player.new(name: player_name, balance: 100)
#
# puts "Hello #{player.name}"
#
# dealer = Dealer.new({})
#
# deck = Deck.new

game = BlackJackGame.new('Ruslan')
# binding.pry

# player.get_cards(deck.deal_cards(2))
# plalyer_cards_total = player.cards.map { |c| c.value }.inject(:+)
# puts plalyer_cards_total
# dealer.get_cards(deck.deal_cards(2))
# dealer_cards_total = dealer.cards.map { |c| c.value }.inject(:+)
