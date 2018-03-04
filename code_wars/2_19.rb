# Your job is to create a calculator which evaluates expressions in Reverse Polish notation.

# For example expression 5 1 2 + 4 * + 3 - (which is equivalent to 5 + ((1 + 2) * 4) - 3 in normal notation) 
# should evaluate to 14.

# Note that for simplicity you may assume that there are always spaces between numbers and operations, 
# e.g. 1 3 + expression is valid, but 1 3+ isn't.

# Empty expression should evaluate to 0.

# Valid operations are +, -, *, /.

# You may assume that there won't be exceptional situations (like stack underflow or division by zero).

def calc(expr)
  return 0 if expr == ""
  functions = {
    "+" => lambda {|x,y| x.to_i + y.to_i},
    "-" => lambda {|x,y| x.to_i - y.to_i},
    "*" => lambda {|x,y| x.to_i * y.to_i},
    "/" => lambda {|x,y| x.to_i / y.to_i}
  }

  formula = expr.split(" ")
  index = 0
  first_number_index = nil
  second_number_index = nil
  while formula.length > 1 && index != formula.length
    if !functions.keys.any?{ |x| x == formula[index]}
      first_number_index = second_number_index
      second_number_index = index
      index += 1
    else
      formula[index] = functions[formula[index]][formula[first_number_index], formula[second_number_index]]
      formula.delete_at(second_number_index)
      formula.delete_at(first_number_index)
      index = 0
    end
  end

  return formula[-1].to_i == formula[-1].to_f ? formula[-1].to_i : formula[-1].to_f
end

neighbors = {
  "1" => ["1", "2", "4"],
  "2" => ["2", "1", "5","3"],
  "3" => ["3", "2", "6"],
  "4" => ["4", "1", "5","7"],
  "5" => ["5", "2", "4","6","8"],
  "6" => ["6", "3", "5","9"],
  "7" => ["7", "4", "8"],
  "8" => ["8", "5", "7","9","0"],
  "9" => ["9", "6", "8"],
  "0" => ["0", "8"] 
}

code = "00"
options = []
combo = ""
# p neighbors[code[0]].all {|x| x}
p [["0", "0"], ["1", "1"]].transpose

# neighbors[code[0]][0] + neighbors[code[1]][0]
# neighbors[code[0]][0] + neighbors[code[1]][1]
# neighbors[code[0]][1] + neighbors[code[1]][0]
# neighbors[code[0]][1] + neighbors[code[1]][1]