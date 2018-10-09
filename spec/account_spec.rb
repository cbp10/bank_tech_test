require 'account'
describe Account do
  let(:printer_module) { double(:printer_module) }
  subject(:account) { described_class.new(0, printer_module) }

  it 'should increase balance when deposit is made' do
    account.deposit(1000)
    expect(account.balance).to eq 1000
  end

  it 'should decrease balance when withdrawal is made' do
    account.withdrawal(500)
    expect(account.balance).to eq(-500)
  end

  it 'should print statement' do 
    statement = [] 
    expect(printer_module).to receive(:print_statement).with(statement)
    account.print_statement
  end

end
