require 'spec_helper'

RSpec.describe Player do
  let(:player) { Player.new(name: 'Bill', balance: 100) }

  it 'has a name' do
    expect(player).respond_to?(:name)
  end
end
