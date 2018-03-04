def distance(strand_a, strand_b):
  if len(strand_a) != len(strand_b):
    raise ValueError("Your strands don't match")
  diffs = zip(strand_a, strand_b)
  return reduce((lambda x,y : x + 1 if y[0] != y[1] else x), diffs, 0)