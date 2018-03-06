require 'minitest/autorun'
require_relative 'bank_account'

class BankAccountTest < MiniTest::Unit::TestCase
  def test_check_balance_with_valid_balance
    account = BankAccount.new(5)
    assert_equal "Your balance is $5", account.check_balance
  end

  def test_check_balance_with_invalid_balance
    assert_raises(ArgumentError) { test = BankAccount.new("hello") }
  end

  def test_math_around_deposits
    base = rand(100)
    account = BankAccount.new(base)
    add = rand(100)
    account.deposit(add)
    assert_equal add + base, account.balance
  end

  def test_invalid_deposit
    account = BankAccount.new(5)
    assert_raises(ArgumentError) { account.deposit("hello")}
  end

  def test_math_around_withdrawals
    base = 100
    withdrawal = rand(99)
    account = BankAccount.new(base)
    account.withdraw(withdrawal)
    assert_equal base - withdrawal, account.balance
  end

  def test_overdrafting_on_withdrawal
    base = rand(100)
    withdrawal = base + rand(50)
    account = BankAccount.new(base)
    account.withdraw(withdrawal)
    assert_equal base, account.balance
  end

  def test_invalid_withdrawal
    account = BankAccount.new(5)
    assert_raises(ArgumentError) { account.withdraw("hello")}
  end

  def test_transfer
    account_1 = BankAccount.new(100)
    account_2 = BankAccount.new(100)
    account_1.transfer_to(account_2, 50)
    assert_equal [50, 150], [account_1.balance, account_2.balance]
  end

  def test_overdraft_on_transfer
    account_1 = BankAccount.new(100)
    account_2 = BankAccount.new(100)
    account_1.transfer_to(account_2, 150)
    assert_equal [100, 100], [account_1.balance, account_2.balance]
  end

  def test_invalid_account_for_transfer
    account_1 = BankAccount.new(100)
    assert_raises(ArgumentError) { account_1.transfer_to("hello", 150) }
  end

  def test_invalid_amount_for_transfer
    account_1 = BankAccount.new(100)
    account_2 = BankAccount.new(100)
    assert_raises(ArgumentError) { account_1.transfer_to(account_2, "hello") }
  end
end