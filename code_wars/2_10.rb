# Write a function that takes an (unsigned) integer as input, and returns the number of bits that are equal to one in the binary representation of that number.

# Example: The binary representation of 1234 is 10011010010, so the function should return 5 in this case

def count_bits(n)
  bit = n.to_s(2)
  bit.count("1")
end

# In this kata, you must create a digital root function.

# A digital root is the recursive sum of all the digits in a number. Given n, take the sum of the digits of n. If that value has two digits, continue reducing in this way until a single-digit number is produced. This is only applicable to the natural numbers.

# Here's how it works (Ruby example given):

# digital_root(16)
# => 1 + 6
# => 7

# digital_root(942)
# => 9 + 4 + 2
# => 15 ...
# => 1 + 5
# => 6

# digital_root(132189)
# => 1 + 3 + 2 + 1 + 8 + 9
# => 24 ...
# => 2 + 4
# => 6

# digital_root(493193)
# => 4 + 9 + 3 + 1 + 9 + 3
# => 29 ...
# => 2 + 9
# => 11 ...
# => 1 + 1
# => 2

def test(n)
  number = n
  while number > 10
    number = number.to_s.split("").reduce(0) { |sum, x| sum + x.to_i}
  end
  number
end

# Write Number in Expanded Form
# You will be given a number and you will need to return it as a string in Expanded Form. For example:

# expanded_form(12); # Should return '10 + 2'
# expanded_form(42); # Should return '40 + 2'
# expanded_form(70304); # Should return '70000 + 300 + 4'
# NOTE: All numbers will be whole numbers greater than 0.

def expanded_form(num)
  operand = 0
  numbers = num.digits.map do|x| 
    operand = (operand == 0 ? 1 : operand * 10)
    (x * operand).to_s
  end
  numbers.reverse.reduce {|final, num| final + " + " + num }

end

p expanded_form(5026)
