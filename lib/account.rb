class Account
  attr_reader :balance

  def initialize(balance = 0)
    @balance = balance
  end

  def deposit(amount, date)
    @balance += amount
  end

  def withdrawal(amount, date)
  end

end
