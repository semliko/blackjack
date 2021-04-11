RSpec.describe User do
  let(:user) { User.new(name: 'Bill', balance: 100) }

  it 'has a name' do
    expect(user).respond_to?(:name)
  end

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
    expect(user.balance).to eq 200
  end

  it 'can deduct from balance' do
    user.add_balance(100)
    user.remove_balance(10)
    expect(user.balance).to eq 190
  end

  it 'rises an error on negative balance deduction' do
    user.balance = 0
    expect { user.remove_balance(10) }.to raise_error(RuntimeError, 'Emount is shoter then balance')
  end

  it 'can show cards' do
    deck = Deck.new
    cards = deck.deal_cards(2)
    user.get_cards(cards)
    expect(user.show_cards.length).to eq 2
    expect(user.show_cards).to eq(cards.map(&:label))
  end
end
