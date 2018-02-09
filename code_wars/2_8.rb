# Mr. Scrooge has a sum of money 'P' that wants to invest, and he wants to know how many years 'Y' this sum has to be kept in the bank in order for this sum of money to amount to 'D'.

# The sum is kept for 'Y' years in the bank where interest 'I' is paid yearly, and the new sum is re-invested yearly after paying tax 'T'

# Note that the principal is not taxed but only the year's accrued interest

# Example:

#   Let P be the Principal = 1000.00      
#   Let I be the Interest Rate = 0.05      
#   Let T be the Tax Rate = 0.18      
#   Let D be the Desired Sum = 1100.00


# After 1st Year -->
#   P = 1041.00
# After 2nd Year -->
#   P = 1083.86
# After 3rd Year -->
#   P = 1128.30
# Thus Mr. Scrooge has to wait for 3 years for the initial pricipal to ammount to the desired sum.

# Your task is to complete the method provided and return the number of years 'Y' as a whole in order for Mr. Scrooge to get the desired sum.

# Assumptions : Assume that Desired Principal 'D' is always greater than the initial principal, however it is best to take into consideration that if the Desired Principal 'D' is equal to Principal 'P' this should return 0 Years.

def calculate_years(principal, interest, tax, desired)
  years = 0
  total = principal
  while principal < desired
    gain = principal * ( interest)
    tax_paid = ( gain ) * tax
    principal = principal - tax_paid + gain
    years += 1
  end
  return years
end

# You probably know the "like" system from Facebook and other pages. People can "like" blog posts, pictures or other items. We want to create the text that should be displayed next to such an item.

# Implement a function likes :: [String] -> String, which must take in input array, containing the names of people who like an item. It must return the display text as shown in the examples:

# likes [] // must be "no one likes this"
# likes ["Peter"] // must be "Peter likes this"
# likes ["Jacob", "Alex"] // must be "Jacob and Alex like this"
# likes ["Max", "John", "Mark"] // must be "Max, John and Mark like this"
# likes ["Alex", "Jacob", "Mark", "Max"] // must be "Alex, Jacob and 2 others like this"
# For more than 4 names, the number in and 2 others simply increases.

def likes(names)
  list_of_people = "no one"
  if names.length == 1
    list_of_people = names[0]
  elsif names.length == 2
    list_of_people = names[0] + " and " + names[1]
  elsif names.length == 3
    list_of_people = names[0] + ", " + names[1] + " and " + names[2]
  elsif names.length > 3
    list_of_people = names[0] + ", " + names[1] + " and #{names.length - 2} others"
  else
  end
  ending = " like" + (names.length > 1 ? "" : "s") + " this"
  list_of_people + ending
end

# You live in the city of Cartesia where all roads are laid out in a perfect grid. 
# You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. 
# The city provides its citizens with a Walk Generating App on their phones 
# -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). 
# You know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes 
# (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

# # Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). 
# It will never give you an empty array (that's not a walk, that's standing still!).

def isValidWalk(walk)
  walk.length == 10 && walk.count("n") == walk.count("s") && walk.count("e") == walk.count("w")
end

# Build Tower by the following given argument:
# number of floors (integer and always greater than 0).

# for example, a tower of 3 floors looks like below

# [
#   '  *  ', 
#   ' *** ', 
#   '*****'
# ]
# and a tower of 6 floors looks like below

# [
#   '     *     ', 
#   '    ***    ', 
#   '   *****   ', 
#   '  *******  ', 
#   ' ********* ', 
#   '***********'
# ]

# Tower block is represented as *

def towerBuilder(n_floors)
  floors = []
  width = n_floors * 2 + 1
  n_floors.times do |n|
    blocks = "*" * 2 * n + "*"
    space = "" 
    ((width - blocks.length - 1 ) / 2).times do
      space += " "
    end
    floors << space + blocks + space
  end
  return floors
end

p towerBuilder(1)