# A friend of mine takes a sequence of numbers from 1 to n (where n > 0).
# Within that sequence, he chooses two numbers, a and b.
# He says that the product of a and b should be equal to the sum of all numbers in the sequence, excluding a and b.
# Given a number n, could you tell me the numbers he excluded from the sequence?
# The function takes the parameter: n (don't worry, n is always strictly greater than 0 and small enough so we shouldn't have overflow) and returns an array of the form:

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or or [{a, b}, ...]
# with all (a, b) which are the possible removed numbers in the sequence 1 to n.

# [(a, b), ...] or [[a, b], ...] or {{a, b}, ...} or ...will be sorted in increasing order of the "a".

# It happens that there are several possible (a, b). The function returns an empty array if no possible numbers are found which will prove that my friend has not told the truth! (Go: in this case return nil).

# (See examples for each language in "RUN EXAMPLES")

# #Examples:

# removNb(26) should return [(15, 21), (21, 15)]
# or

# removNb(26) should return { {15, 21}, {21, 15} }
# or

# removeNb(26) should return [[15, 21], [21, 15]]
# or

# removNb(26) should return [ {15, 21}, {21, 15} ]
# or

# in C:
# removNb(26) should return  **an array of pairs {{15, 21}{21, 15}}**
# tested by way of strings.

def removNb(n)
  answers = []
  total = (0..n).reduce(:+).to_f
  for x in (0..n)
    y = (total - x) / (x + 1)
    answers << [x,y.to_i] if y < n && y == y.to_i
  end
  answers
end

# Create a function that takes a Roman numeral as its argument and returns its value as a numeric decimal integer. You don't need to validate the form of the Roman numeral.

# Symbol    Value
# I          1
# V          5
# X          10
# L          50
# C          100
# D          500
# M          1,000

def solution(roman)
  values = {
    "I" => 1,
    "V" => 5,
    "X" => 10,
    "L" => 50,
    "C" => 100,
    "D" => 500,
    "M" => 1000
  }
  total = 0
  roman.length.times do |x|
    character = values[roman[x]]
    next_character = values[roman[x + 1]] || 0
    if character >= next_character
      total += character
    else
      total -= character
    end
  end
  total
end



