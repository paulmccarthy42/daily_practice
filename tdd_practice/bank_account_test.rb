require 'minitest/autorun'
require_relative 'bank_account'

class BankAccountTest < MiniTest::Unit::TestCase
  def test_check_balance_with_valid_balance
    account = BankAccount.new(5)
    assert_equal "Your balance is $5", account.check_balance
  end

  def test_check_balance_with_valid_balance_in_wrong_format
    account = BankAccount.new("5")
    assert_equal "Your balance is $5", account.check_balance
  end

  def test_check_balance_with_invalid_balance
    account = BankAccount.new("hello")
    assert_equal "Your balance is $0", account.check_balance
  end

  def test_math_around_deposits
    base = rand(100)
    account = BankAccount.new(base)
    add = rand(100)
    account.deposit(add)
    assert_equal add + base, account.balance
  end

  def test_math_around_withdrawals
    base = 100
    withdrawal = rand(99)
    account = BankAccount.new(base)
    account.withdraw(withdrawal)
    assert_equal base - withdrawal, account.balance
  end

  def test_overdrafting
    base = rand(100)
    withdrawal = base + rand(50)
    account = BankAccount.new(base)
    account.withdraw(withdrawal)
    assert_equal base, account.balance
  end
end