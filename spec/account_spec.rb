require 'account'
describe Account do
  subject(:account) { described_class.new }

  it 'should increase balance when deposit is made' do
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end

  it 'should decrease balance when withdrawal is made' do
    account.withdrawal(500)
    expect(account.balance).to eq(-500)
  end

  it 'should store transaction row' do
    account.deposit(1000)
    expect(account.statement[0]).to include(amount: 1000, balance: 1000)
  end

  let(:printer_module) { double(:printer_module) }

  it 'should print statement' do
    expect(account).to respond_to(:print_statement)
    statement = [] 
    expect(printer_module).to receive(:print_statement).with(statement)
    account.print_statement(printer_module)
  end

end
