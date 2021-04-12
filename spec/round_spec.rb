require 'spec_helper'

RSpec.describe Round do
  context 'Game round' do
    let(:round) { Round.new }
    let(:player) { Player.new('Bill') }
    let(:dealer) { Dealer.new }

    it 'can start a game' do
      exect(:round).respond_to(:start)
    end

    it 'has players' do
      expec(:round).rspond_to(:players)
    end

    it 'cnnot start if one of the user has no balance to bet' do
    end
  end
end
