# THE BASICS

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

# 5. Write a program that outputs the factorial of the numbers 5, 6, 7, and 8.
fac_5 = 1*2*3*4*5
fac_6 = 1*2*3*4*5*6
fac_7 = 1*2*3*4*5*6*7
fac_8 = 1*2*3*4*5*6*7*8

puts fac_5
puts fac_6
puts fac_7
puts fac_8 

# 6. Write a program that calculates the squares of 3 float numbers of your choosing and outputs the result to the screen.

puts 4.32**2
puts 5.28**2
puts 2.91**2

# 7. What does the following error message tell you?
# There is a closing ) somewhere in the program without a corresponding opening (, and an opening { without a corresponding closing }. It may have happened when creating a hash.

# VARIABLES

# 1. Write a program called name.rb that asks the user to type in their name and then prints out a greeting message with their name included.
name = gets.chomp
puts "Hello " + name