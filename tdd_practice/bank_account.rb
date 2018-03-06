class BankAccount
  attr_reader :balance

  def initialize(starting_balance=0)
    raise ArgumentError if !starting_balance.is_a?(Integer)
    @balance = starting_balance.to_i
  end

  def check_balance
    "Your balance is $#{@balance}"
  end

  def deposit(amount)
    raise ArgumentError if !amount.is_a?(Integer)
    @balance += amount
  end

  def withdraw(amount)
    raise ArgumentError if !amount.is_a?(Integer)
    if (@balance - amount) > 0
      @balance -= amount
    end
  end

  def transfer_to(other_account, amount)
    raise ArgumentError if !amount.is_a?(Integer) || !other_account.is_a?(BankAccount)
    if (@balance - amount) > 0
      withdraw(amount)
      other_account.deposit(amount)
    end
  end
end