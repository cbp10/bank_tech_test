module StatementPrinter

  HEADER = "date || credit || debit || balance"

  def self.print_statement(statement)
    add_header_row(statement)
    statement.sort.reverse_each { |row|
      puts row
    }
  end

  def self.add_header_row(statement)
    statement.unshift(HEADER)
  end

end
