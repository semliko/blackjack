require 'pry'

RSpec.describe Deck do
  let(:deck) { Deck.new }

  context 'Cards' do
    it 'has cards' do
      expect(deck).respond_to?(:cards)
    end

    it 'has discarded cards' do
      expect(deck).respond_to?(:discarded_cards)
    end

    it 'has dealed cards' do
      expect(deck).respond_to?(:dealed_cards)
    end

    it 'can shuffle cards' do
      expect(deck).respond_to?(:shuffle)
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
      deck.shuffle!
      expect(deck.cards).not_to eq(current_cards_order)
    end

    it 'can deal cards' do
      deck.deal_cards(2)
      expect(deck.dealed_cards.length).to eq(2)
    end

    it 'can widraw dealed cards from deck' do
      deck.deal_cards(2)
      expect(deck.cards.length).to eq(50)
    end

    it 'can move cards to discard pile' do
      discared_cards = deck.deal_cards(4)
      deck.discard_cards(discared_cards)
      expect(deck.discarded_cards).to include(discared_cards)
    end

    it 'does not deal discarded cards' do
      discared_cards = deck.deal_cards(5)
      deck.discard_cards(discared_cards)
      expect(deck.cards).not_to include(discared_cards)
    end
  end
end
