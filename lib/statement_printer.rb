module StatementPrinter

  HEADER = "date || credit || debit || balance"

  def self.print_statement(statement)
    add_header_row(statement)
    statement.sort.reverse.each { |row|
      puts row
    }
  end

  private

  def self.add_header_row(statement)
    statement.unshift(HEADER)
  end

end
