describe 'transactions' do
  
  it 'so that a client can save money, they can make a deposit' do
    client_account = Account.new 
    client_account.deposit(100)
    expect(client_account.balance).to eq 100
  end

  it 'so that a client can spend money, they can make a withdrawal' do
    client_account = Account.new 
    client_account.deposit(100)
    client_account.withdrawal(50)
    expect(client_account.balance).to eq 50
  end

  it 'so that the client can see how much money they have, they can print transactions' do
    client_account = Account.new 
    allow(Time).to receive(:now).and_return(DateTime.new(2012, 01, 10))
    client_account.deposit(1000)
    allow(Time).to receive(:now).and_return(DateTime.new(2012, 01, 13))
    client_account.deposit(2000)
    allow(Time).to receive(:now).and_return(DateTime.new(2012, 01, 14))
    client_account.withdrawal(500)

    expect { client_account.print_statement }.to output(
        "date || credit || debit || balance\n"\
        "14/01/2012 || || 500.00 || 2500.00\n"\
        "13/01/2012 || 2000.00 || || 3000.00\n"\
        "10/01/2012 || 1000.00 || || 1000.00\n"
      ).to_stdout
  end
end
