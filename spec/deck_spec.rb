RSpec.describe Deck do
  let(:deck) { Deck.new }

  context 'Cards' do
    it 'has cards' do
      expect(deck).response_to?(:cards)
    end

    it 'has discarded cards' do
      expect(deck).respinse_to?(:discarded_cards)
    end

    it 'has dealed cards' do
      expect(deck).response_to?(:dealed_cards)
    end

    it 'can shuffle cards' do
      expect(deck).response_to?(:shuffle)
    end

    it 'can generate 52 cards' do
      deck.generate_cards
      expect(deck.cards.count).to eq 52
    end

    it 'has all different cards' do
      expect(deck.cards.uniq.length).to eq 52
    end

    it 'shuffles cards to ramdomize them' do
      current_cards_order = deck.cards
      deck.suffle!
      expect(deck.cards).not_to eq(current_cards_order)
    end

    it 'can deal cards' do
      deck.deal_cards(2)
      expect(deck.daled_cards).to eq(2)
    end

    it 'can widraw dealed cards from deck' do
      deck.deal_cards(2)
      expect(deck.cards).to eq(50)
    end

    it 'can move cards to discard pile' do
      deck.discard_cards(cards)
      expect(deck.discarded_cards).to eq(cards.length)
    end

    it 'does not deal discarded cards' do
      deck.discard_cards(cards)
      expect(deck.cards).not_to include(cards)
    end
  end
end
