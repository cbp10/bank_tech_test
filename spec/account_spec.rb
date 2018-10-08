require 'account'
describe Account do
  subject(:account) { described_class.new }
  it 'should return initial balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'should increase balance when deposit is made' do
    expect(account).to respond_to(:deposit).with(2).arguments
  end

end
