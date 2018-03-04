import re

def word_count(phrase):
  words = re.sub("[,\s_]+", " ", phrase).lower().split(" ")
  freqs = dict()
  for word in words:
    clean_word = re.sub("(^\W+|\W+$)", "", word)
    if clean_word != "":
      freqs[clean_word] = freqs.setdefault(clean_word, 0) + 1
  return freqs

print word_count("hey,my_spacebar_is_broken.")