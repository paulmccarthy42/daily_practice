# Create a function that returns the sum of the two lowest positive numbers given an array of minimum 4 integers. 
# No floats or empty arrays will be passed.

# For example, when an array is passed like [19, 5, 42, 2, 77], the output should be 7.

# [10, 343445353, 3453445, 3453545353453] should return 3453455.

# Hint: Do not modify the original array.

def sum_two_smallest_numbers(numbers)
  smallest = nil
  second_smallest = nil
  numbers.each do |x|
    if second_smallest == nil || x < second_smallest
      if smallest == nil || x < smallest
        second_smallest = smallest
        smallest = x
      else
        second_smallest = x
      end
    end
  end
  return smallest + second_smallest
end

# x Simple, given a string of words, return the length of the shortest word(s).

# String will never be empty and you do not need to account for different data types.

def find_short(s)
  words = s.split(" ")
  l = nil
  words.each do |x|
    if l == nil || x.length < l
      l = x.length
    end
  end
  return l # l: length of the shortest word
end

# The goal of this exercise is to convert a string to a new string where each character in the new string is '(' if that character appears only once in the original string, or ')' if that character appears more than once in the original string. Ignore capitalization when determining if a character is a duplicate.

# Examples:

# "din" => "((("

# "recede" => "()()()"

# "Success" => ")())())"

# "(( @" => "))(("

def duplicate_encode(word)
  letter_count = Hash.new(0)
  word.each_char {|letter| letter_count[letter.downcase] += 1}
  encoded = ""
  word.each_char do |letter| 
    encoded += "(" if letter_count[letter.downcase] == 1
    encoded += ")" if letter_count[letter.downcase] > 1
  end
  return encoded
end

# Create a function named divisors/Divisors that takes an integer and returns an array with all of the integer's divisors(except for 1 and the number itself). If the number is prime return the string '(integer) is prime' (null in C#) (use Either String a in Haskell and Result<Vec<u32>, String> in Rust).

# Example:
# divisors(12) # should return [2,3,4,6]
# divisors(25) # should return [5]
# divisors(13) # should return "13 is prime"
# You can assume that you will only get positive integers as inputs.

def divisors(n)
  divisors = (2..n/2).select {|x| n % x == 0}
  return divisors == [] ? "#{n} is prime" : divisors 
end

