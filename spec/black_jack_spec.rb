Dir['./*.rb'].each { |file| require file }

RSpec.describe BlackJackGame do
  let(:player) { Player.new(name: 'Bill', balance: 100) }
  let(:dealer) { Dealer.new(balance: 100) }
  let(:deck) { Deck.new }
  let(:blackjeck) { BlackJackGame.new(dealer, deck, player) }

  context 'BlackJack Game' do
    it 'can start game' do
      expect(:blackjeck).respond_to?(:start_game)
    end

    it 'can end game' do
      expect(:blackjeck).respond_to?(:end_game)
    end

    it 'Passes two cards to user from deck' do
      player.get_cards(deck.deal_cards(2))
      expect(player.cards.length).to eq(2)
    end

    it 'Passes two cards to dealer from deck' do
      player.get_cards(deck.deal_cards(2))
      expect(player.cards.length).to eq(2)
    end
  end
end
