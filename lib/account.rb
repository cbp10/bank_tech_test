require_relative 'statement_printer'
class Account
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = []
  end

  def deposit(amount)
    @balance += amount
    update_statement(amount, true)
  end

  def withdrawal(amount)
    @balance -= amount
    update_statement(amount, false)
  end

  def print_statement(printer = StatementPrinter)
    printer.print_statement(statement)
  end

  private

  def update_statement(amount, credit)
    @statement.push( {amount: amount, balance: @balance, credit: credit, date: Time.now.strftime("%d/%m/%Y")} )
  end

end
