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
    update_statement(date, amount, "credit")
  end

  def withdrawal(amount, date)
    @balance -= amount
    update_statement(date, amount, "debit")
  end

  def print_statement
    printer.print_statement(statement)
  end

  private

  def update_statement(date, amount, type)
    type == "credit" ? @statement.push("#{date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}") :
                @statement.push("#{date} || || #{'%.2f' % amount} || #{'%.2f' % @balance}")
  end

end
