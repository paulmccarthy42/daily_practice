import re

def is_pangram(sentence):
    check = {}
    clean_string = re.sub("[\W_\d]", "", sentence).lower()
    for letter in clean_string:
      if check.setdefault(letter, None) == None:
        check[letter] = 1
      else:
        check[letter] += 1
    return len(check.keys())== 26