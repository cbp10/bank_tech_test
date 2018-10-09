require 'account'
describe Account do
  let(:printer_module) { double(:printer_module) }
  subject(:account) { described_class.new(0, printer_module) }

  it 'should increase balance when deposit is made' do
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end

  it 'should raise error if deposit is made with amount as string' do
    expect { account.deposit("money") }.to raise_error "Cannot make deposit: Value not recognised"
  end

  it 'should decrease balance when withdrawal is made' do
    account.deposit(1000)
    account.withdrawal(500)
    expect(account.balance).to eq(500)
  end

  it 'should raise error if withdrawal is made with not enough funds in account' do
    expect { account.withdrawal(500) }.to raise_error "Cannot make withdrawal: Not enough funds in account"
  end

  it 'should raise error if withdrawal is made with amount as string' do
    expect { account.withdrawal("money") }.to raise_error "Cannot make withdrawal: Value not recognised"
  end

  it 'should print statement' do 
    statement = [] 
    expect(printer_module).to receive(:print_statement).with(statement)
    account.print_statement
  end

end
