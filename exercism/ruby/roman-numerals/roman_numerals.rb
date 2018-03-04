class Integer

  ARABIC_TO_ROMAN = {
    1000 => "M",
    900 => "CM",
    500 => "D",
    400 => "CD",
    100 => "C",
    90 => "XC",
    50 => "L",
    40 => "XL",
    10 => "X",
    9 => "IX",
    5 => "V",
    4 => "IV",
    1 => "I"
  }

  def to_roman
    arabic_start = self
    roman_result = ""
    ARABIC_TO_ROMAN.each do |arabic,roman|
      number_of_symbols = (arabic_start / arabic)
      if number_of_symbols >= 1
        roman_result += roman * number_of_symbols
        arabic_start -= arabic * number_of_symbols
      end
    end
    roman_result
  end
end

module BookKeeping
  VERSION = 2 # Where the version number matches the one in the test.
end

p 5.to_roman