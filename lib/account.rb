require_relative 'statement_printer'
class Account
  attr_reader :balance, :statement, :printer

  def initialize(balance = 0, printer = StatementPrinter)
    @balance = balance
    @statement = []
    @printer = printer
  end

  def deposit(amount, date)
    @balance += amount
    update_statement(date, amount)
  end

  def withdrawal(amount, date)
    @balance -= amount
    update_statement(date, -amount)
  end

  def print_statement
    printer.print_statement(statement)
  end

  private

  def update_statement(date, amount)

    amount > 0 ? @statement.push("#{date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}") :
                @statement.push("#{date} || || #{'%.2f' % amount} || #{'%.2f' % @balance}")
  end

  def add_header_row
    @statement.unshift(HEADER)
  end

end
