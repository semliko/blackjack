RSpec.describe Player do
  let(:player) { Player.new }

  it 'has a name' do
    expect(player).response_to?(:name)
  end
end
