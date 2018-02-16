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

# Your task in order to complete this Kata is to write a function which formats a duration, given as a number of seconds, in a human-friendly way.

# The function must accept a non-negative integer. If it is zero, it just returns "now". Otherwise, the duration is expressed as a combination of years, days, hours, minutes and seconds.

# It is much easier to understand with an example:

#   format_duration(62)    # returns "1 minute and 2 seconds"
#   format_duration(3662)  # returns "1 hour, 1 minute and 2 seconds"

def format_duration(seconds)
  return "now" if seconds == 0
  second = seconds
  minute = seconds / 60
  second %= 60
  hour = minute / 60
  minute %= 60
  day = hour / 24
  hour %= 24
  year = day / 365
  day %= 365  

  time = []
  time << "#{year} year#{year > 1 ? "s" : ""}" if year > 0
  time << "#{day} day#{day > 1 ? "s" : ""}" if day > 0
  time << "#{hour} hour#{hour > 1 ? "s" : ""}" if hour > 0
  time << "#{minute} minute#{minute > 1 ? "s" : ""}" if minute > 0
  time << "#{second} second#{second > 1 ? "s" : ""}" if second > 0
  formatted_time = ""
  time.length.times do |x| 
    if x == 0
      formatted_time += time[x]
    elsif x != time.length - 1
      formatted_time += ", "
      formatted_time += time[x]
    else
      formatted_time += " and "
      formatted_time += time[x]
    end
  end
  formatted_time
end

# Write a function done_or_not/DoneOrNot passing a board (list[list_lines]) as parameter. If the board is valid return 'Finished!', otherwise return 'Try again!'

# Sudoku rules:

# Complete the Sudoku puzzle so that each and every row, column, and region contains the numbers one through nine only once.
def board_regions(board)
  checkable = []
  columns = []
  9.times {|x| columns << []}
  board.each do |row| 
    checkable << row
    9.times do |column_element|
      columns[column_element] << row[column_element]
    end
  end
  columns.each {|column| checkable << column}
  3.times do |x|
    3.times do |y|
      checkable << board[3 * x][(3*y)..(3 * y + 2)] + board[3 * x + 1][(3*y)..(3 * y + 2)] + board[3 * x + 2][(3*y)..(3 * y + 2)]
    end
  end
  p checkable
end

def done_or_not(board)
  wrong = board_regions(board).select do |region| 
    region.sort != [1,2,3,4,5,6,7,8,9]
  end
  return wrong == [] ? 'Finished!' : "Try again!"
end

board = [[5, 3, 4, 6, 7, 8, 9, 1, 2], 
         [6, 7, 2, 1, 9, 5, 3, 4, 8],
         [1, 9, 8, 3, 4, 2, 5, 6, 7],
         [8, 5, 9, 7, 6, 1, 4, 2, 3],
         [4, 2, 6, 8, 5, 3, 7, 9, 1],
         [7, 1, 3, 9, 2, 4, 8, 5, 6],
         [9, 6, 1, 5, 3, 7, 2, 8, 4],
         [2, 8, 7, 4, 1, 9, 6, 3, 5],
         [3, 4, 5, 2, 8, 6, 1, 7, 9]]
