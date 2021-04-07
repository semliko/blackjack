RSpec.describe Card do
  let(:card) { Card.new(suit: 'suit', rank: 'rank', value: 'value', lable: 'lable') }
  it 'has suit' do
    expect(card).respond_to?(:suit)
  end
  it 'has rank' do
    expect(card).respond_to?(:rank)
  end

  it 'has value' do
    expect(card).respond_to?(:value)
  end

  it 'has a lable' do
    expect(card).respond_to?(:lable)
  end
end
