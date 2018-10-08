require 'statement_printer'
describe StatementPrinter do
  subject(:printer) { described_class }

  it 'should have headers in top row' do
    expect { printer.print_statement([]) }.to output("date || credit || debit || balance\n").to_stdout
  end

end
