module StatementPrinter

  HEADER = "date || credit || debit || balance"

  def self.print_statement(statement)
    transactions = []
    statement.each { |row|
      row[:credit] ?
      transactions.push("#{row[:date]} || #{'%.2f' %row[:amount]} || || #{'%.2f' %row[:balance]}") :
      transactions.push("#{row[:date]} || || #{'%.2f' %row[:amount]} || #{'%.2f' %row[:balance]}")
    } 
    add_header_row(transactions)
    transactions.sort.reverse_each { |transaction|
      puts transaction
    }
  end

  def self.add_header_row(statement)
    statement.unshift(HEADER)
  end

end
