def verify(isbn):
  clean_isbn = isbn.replace("-", "")
  if len(clean_isbn) != 10:
    return False 
  result = 0
  for digit_index in range(0,len(clean_isbn)):
    if digit_index == 9 and clean_isbn[digit_index] == "X":
      result +=  10 * (10 - digit_index)
    else:
      try:
        result += int(clean_isbn[digit_index]) * (10 - digit_index)
      except:
        return False
  return result % 11 == 0

