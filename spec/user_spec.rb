require './user'

RSpec.describe User do
  let(:user) { User.new }

  # it 'has a name' do
  #  expect(user).response_to?(:name)
  # end

  it 'has cards' do
    expect(user).respond_to?(:cards)
  end

  it 'can ask for more cards' do
    expect(user).respond_to?(:request_cards)
  end

  it 'can skip his turn' do
    expect(user).respond_to?(:skip_turn)
  end

  it 'can show cards' do
    expect(user).respond_to?(:show_cards)
  end

  it 'has a balance amount' do
    expect(user).respond_to?(:balance)
  end

  it 'can place a bet' do
    expect(user).respond_to?(:place_bet)
  end

  it 'can bank a money' do
    expect(user).respond_to?(:bank_money)
  end

  it 'can add to balance' do
    user.add_balance(100)
    expect(user.balance).to eq 100
  end

  it 'can deduct from balance' do
    user.add_balane(100)
    user.remove_balance(10)
    expect(user.balance).to eq 90
  end
end
