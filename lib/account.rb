class Account
  attr_reader :balance, :statement

  def initialize(balance = 0)
    @balance = balance
    @statement = []
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
  end

  private

  def update_statement(date, amount)

    amount > 0 ? @statement.push("#{date} || #{'%.2f' % amount} || || #{'%.2f' % @balance}") :
                @statement.push("#{date} || || #{'%.2f' % amount} || #{'%.2f' % @balance}")
  end
end
