require_relative 'statement_printer'
class Account
  attr_reader :balance

  def initialize(balance = 0, printer = StatementPrinter)
    @balance = balance
    @statement = []
    @printer = printer
  end

  def deposit(amount)
    @balance += amount
    update_statement(amount, true)
  end

  def withdrawal(amount)
    fail "Cannot make withdrawal: Not enough funds in account" if amount > balance
    @balance -= amount
    update_statement(amount, false)
  end

  def print_statement
    printer.print_statement(statement)
  end

  private
  attr_reader :statement, :printer

  def update_statement(amount, credit)
    @statement.push( {amount: amount, balance: @balance, credit: credit, date: Time.now } )
  end

end
