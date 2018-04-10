import re
def hey(phrase):
  phrase = re.sub("\s", "", phrase)
  if not phrase:
    return "Fine. Be that way!"
  elif phrase.upper() == phrase and phrase.upper() != phrase.lower() and phrase[-1] == "?":
    return "Calm down, I know what I'm doing!"
  elif phrase.upper() == phrase and phrase.upper() != phrase.lower():
    return "Whoa, chill out!"
  elif phrase[-1] == "?":
    return "Sure."
  else:
    return "Whatever." 

print hey("Tom-ay-to, tom-aaaah-to.")
# print len(re.sub("\s", "", "    "))