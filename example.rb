# The Basics

# 1. Add two strings together that, when concatenated, return your first and last name as your full name in one string.
first_name = "Jenesis"
last_name = "Merriman"

puts first_name + " " + last_name

# 2. Use the modulo operator, division, or a combination of both to take a 4 digit number and find the digit in the: 1) thousands place 2) hundreds place 3) tens place 4) ones place
thousands = 4936 / 1000
hundreds = 4936 % 1000 / 100
tens = 4936 % 100 / 10
ones = 4936 % 10

puts "thousands: #{thousands}"
puts "hundreds: #{hundreds}"
puts "tens: #{tens}"
puts "ones: #{ones}"

# 3. Write a program that uses a hash to store a list of movie titles with the year they came out. Then use the puts command to make your program print out the year of each movie
movies = {
  hulk: 2001,
  hereditary: 2019,
  conjuring: 2018,
  feed: 2005,
  frozen: 2016
}

puts movies[:hulk]
puts movies[:hereditary]
puts movies[:conjuring]
puts movies[:feed]
puts movies[:frozen]

# 4. Use the dates from the previous example and store them in an array. Then make your program output the same thing as exercise 3.

#my attempt
array = [movies[:hulk], movies[:hereditary], movies[:conjuring], movies[:feed], movies[:frozen]]

#ls solution
years = [2001, 2019, 2018, 2005, 2016]

puts years[0]
puts years[1]
puts years[2]
puts years[3]
puts years[4]