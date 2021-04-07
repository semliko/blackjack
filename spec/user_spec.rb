require './user'

RSpec.describe User do
  let(:user) { User.new }

  it 'has a name' do
    expect(user).response_to?(:name)
  end

  it 'has cards' do
    expect(user).response_to?(:cards)
  end

  it 'can ask for more cards' do
    expect(user).response_to?(:request_cards)
  end

  it 'can skip his turn' do
    expect(user).response_to?(:skip_turn)
  end

  it 'can show cards' do
    expect(user).response_to?(:show_cards)
  end

  it 'has a balance amount' do
    expect(user).response_to?(:balance)
  end

  it 'can place a bet' do
    expect(user).response_to?(:place_bet)
  end

  it 'can bank a money' do
    expect(user).response_to?(:bank_money)
  end
end
