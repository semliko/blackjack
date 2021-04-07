RSpec.describe BlackJackGame do
  let(:player) { Player.new(name: 'Bill', balance: 100) }
  let(:dealer) { Dealer.new(balance: 100) }
  let(:deck) { Deck.new(game: blackjeck) }
  context 'BlackJack Game' do
    it 'Passes two cards to user from deck' do
      player.get_cards(deck.widraw_cards(2))
      expect(player.cards.length).to eq(2)
    end

    it 'Passes two cards to dealer from deck' do
      player.get_cards(deck.widraw_cards(2))
      expect(player.cards.length).to eq(2)
    end
  end
end
