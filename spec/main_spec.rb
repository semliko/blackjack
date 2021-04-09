RSpec.describe do
  let(:player) { Player.new(name: 'Bill', balance: 100) }
  let(:dealer) { Dealer.new(balance: 100) }
  let(:deck) { Deck.new }
  let(:blackjeck) { BlackJackGame.new(dealer, deck, player) }
end
