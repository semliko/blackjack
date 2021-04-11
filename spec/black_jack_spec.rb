require 'spec_helper'

RSpec.describe BlackJackGame do
  context 'BlackJack Game' do
    let(:blackjeck) { BlackJackGame.new('Bill') }
    let(:player) { blackjeck.player }
    let(:dealer) { blackjeck.dealer }
    let(:deck) { blackjeck.deck }
    let(:bank) { blackjeck.bank }

    it 'end game if player has not money to bet' do
      expect do
        blackjeck.place_bet
      end.to output("Player #{player.name} has not enough money to place a bet\nGame over\n").to_stdout
      expect(blackjeck.keep_playing).to be_falsey
    end

    it 'can start game' do
      blackjeck.start_game
      expect(player.cards.count).to eq 2
      expect(dealer.cards.count).to eq 2
    end

    it 'can place a bet' do
      blackjeck.place_bet
      expect(bank).to eq 20
    end

    it 'can end game' do
      expect(:blackjeck).respond_to?(:end_game)
    end

    it 'can bank money' do
      expect(:blakjeck).respond_to?(:bank_bet_money)
    end

    it 'Passes two cards to user from deck' do
      player.get_cards(deck.deal_cards(2))
      expect(player.cards.length).to eq(2)
    end

    it 'Passes two cards to dealer from deck' do
      player.get_cards(deck.deal_cards(2))
      expect(player.cards.length).to eq(2)
    end

    it 'stops the round if both players have 3 or more cards' do
      player.get_cards(deck.deal_cards(3))
      dealer.get_cards(deck.deal_cards(4))
      expect(blackjeck.round_finished?).to eq true
    end
  end
end
