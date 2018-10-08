require 'statement_printer'
describe StatementPrinter do
  subject(:printer) { described_class }
  let(:statement) { ["10/01/2012 || 1000.00 || || 1000.00"] }
  let(:statement_unordered) { ["10/01/2012 || 1000.00 || || 1000.00", "14/01/2012 || || 500.00 || 1500.00", "11/01/2012 || 1000.00 || || 2000.00"] }

  it 'should have headers in top row' do
    expect { printer.print_statement([]) }.to output("date || credit || debit || balance\n").to_stdout
  end

  it 'should have transaction rows' do
    expect { printer.print_statement(statement) }.to output("date || credit || debit || balance\n"\
                                                            "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
  end

  it 'should have transaction row in date order' do
    expect { printer.print_statement(statement_unordered) }.to output("date || credit || debit || balance\n"\
                                                            "14/01/2012 || || 500.00 || 1500.00\n"\
                                                            "11/01/2012 || 1000.00 || || 2000.00\n"\
                                                            "10/01/2012 || 1000.00 || || 1000.00\n").to_stdout
  end
end
