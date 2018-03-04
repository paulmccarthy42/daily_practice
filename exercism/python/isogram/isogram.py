import re

def is_isogram(string):
    check = {}
    clean_string = re.sub("\W", "", string).lower()
    for letter in clean_string:
      if check.setdefault(letter, None) == None:
        check[letter] = 1
      else:
        return False
    return True