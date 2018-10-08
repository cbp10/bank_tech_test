require 'account'
describe Account do
  subject(:account) { described_class.new }

  it 'should increase balance when deposit is made' do
    expect(account).to respond_to(:deposit).with(1).argument
    expect(account.balance).to eq 0
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end

  it 'should decrease balance when withdrawal is made' do
    expect(account).to respond_to(:withdrawal).with(1).argument
    expect(account.balance).to eq 0
    account.withdrawal(500)
    expect(account.balance).to eq(-500)
  end

  it 'should store transaction row' do
    account.deposit(1000)
    expect(account.statement[0]).to include(amount: 1000, balance: 1000)
  end

  it 'should print statement' do
    expect(account).to respond_to(:print_statement)
    expect { account.print_statement }.to output("date || credit || debit || balance\n").to_stdout
  end

end
