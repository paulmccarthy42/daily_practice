class BeerSong
  def verses(start, ending = start)
    verses = ""
    while start >= ending
      verses += verse(start)
      verses += "\n" if start != ending
      start -= 1
    end
    verses
  end

  def verse(input)
    """#{first_line(input)}
#{input > 0 ? second_line(input - 1) : final_line}
"""
  end

  def up_count(x)
    x == 0 ? "No more" : x
  end

  def down_count(x)
    x == 0 ? "no more" : x
  end

  def plural(x)
    x != 1 ? "s" : ""
  end

  def first_line(x)
    "#{up_count(x)} bottle#{plural(x)} of beer on the wall, #{down_count(x)} bottle#{plural(x)} of beer."
  end

  def second_line(x)
    size = (x != 0 ? "one" : "it")
    "Take #{size} down and pass it around, #{down_count(x)} bottle#{plural(x)} of beer on the wall." 
  end

  def final_line
    "Go to the store and buy some more, 99 bottles of beer on the wall."
  end
end

module BookKeeping
  VERSION = 3
end

