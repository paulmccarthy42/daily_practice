def is_hamming?(number)
  [2,3,5].each do |factor|
    while number % factor == 0
      number /= factor
    end
  end
  number == 1
end

p is_hamming?(51)