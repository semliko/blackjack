require './user'

RSpec.describe User do
  it 'has a name' do
    user = User.new('Bill')
    expect(user.name).to eq 'Bill'
  end
end
