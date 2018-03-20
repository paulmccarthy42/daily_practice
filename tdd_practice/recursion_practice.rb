def bwuah(count = 1)
  if count <= 15
    p "INCEPTION"
    bwuah(count + 1)
  end
end

def even(count = 0)
  if count <= 100
    p count
    even(count+2)
  end
end

def reduce(count = 1, sum = 0)
  count <= 1000 ? reduce(count+1, sum + count) : sum
end

def reduce_array(array, index = 0, sum = 0)
  index < array.length ? reduce_array(array, index + 1, sum + array[index]) : sum
end

def factorial(number, fact = 1)
  number == 0 ? fact : factorial(number - 1, fact * number)
end

def fibonacci(prev = 1, second = 0)
  if prev <= 987
    p prev
    fibonacci(prev + second, prev )
  end 
end

def reverse_string(string, new_string = "")
  if string != ""
    new_string += string.slice(-1)
    reverse_string(string.slice(0,string.length - 1), new_string)
  else
    new_string
  end
end

def remainder(num, den)
  num < den ? num : remainder(num - den, den)
end

def power(base, power, total = 1)
  return total if power == 0
  power > 0 ? power(base, power - 1, total * base) : power(base, power + 1, total * 1.0 / base)
end

