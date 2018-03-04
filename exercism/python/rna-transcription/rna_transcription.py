conversions = {
  "C" : "G",
  "G" : "C",
  "T" : "A",
  "A" : "U"
}

def to_rna(dna_strand):
  rna = ""
  for x in dna_strand:
    if conversions.setdefault(x, None) != None:
      rna += conversions[x]
    else:
      return None
  return rna