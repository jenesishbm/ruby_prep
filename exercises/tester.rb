## PRACTICE ROUND 2

=begin VARIABLE SCOPE
1. 7 - numbers are immutable in ruby / in methods
2. 7 - numbers are immutable in ruby / in methods
3. 7 - numbers are immutable in ruby / in methods
4. Xy-zy - strings are mutable and [] is a modifying method
5. Xyzzy - Assignment never changes the value of an object; instead, it creates a new object, and then stores a reference to that object in the variable on the left
*6. ERROR: a is not defined inside the method so it has no knowledge of it. Even though a is defined before my_value is defined, it is not visible inside my_value. Method definitions are self contained with respect to local variables. Local variables initialized inside the method definition are not visible outside the method definition, and local variables initialized outside the method definition are not visible inside the method definition.
7. 3 - In this case, a starts out as 7, then we set a to 1, 2 and 3 in sequence. By the time we get to the puts, a has a value of 3.
8. ERROR: a is not defined outside of the method.
9. 7. The code block iterates over each element a in the array, not our variable a, so it remains unchanged at 7.
*10.ERROR. I thought it might be 7 but actually it's an error because a at the top level is not visible within our block because because the invocation of each is inside my_value, and method definitions are self-contained with respect to local variables.

=end

# LOOPS 1
# 1.
loop do
  puts 'Just keep printing...'
  break # breaks loop after one iteration
end

# 2.
loop do
  puts 'This is the outer loop.'
  loop do
    puts 'This is the inner loop.'
    break # breaks inner loop
  end
  break # breaks outer loop after inner loop executes
end

puts 'This is outside all loops.'

# 3.
iterations = 1

loop do
  puts "Number of iterations = #{iterations}" # print
  iterations += 1 # add 1 to iteration
  break if iterations > 5 # break after 5 times
end

# 4.
loop do
  puts 'Should I stop looping?'
  answer = gets.chomp
  break if answer == "yes"
end

# 5.
say_hello = true

while say_hello
  5.times { puts 'Hello!' } # num.times { block to execute }
  say_hello = false
end

# OR
say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter == 5
end

# 6. 
numbers = []

while numbers.length < 5 # make sure to be clear on when to set this condition. I originally put < 6 which was WRONG
  numbers << rand(100)
end

puts numbers

# 7. 
count = 1

until count > 10
  puts count
  count += 1
end

# 8.
numbers = [7, 9, 13, 25, 18]
index = 0

until index == numbers.length
  puts numbers[index]
  index += 1
end

# 9.
for i in 1..100
  puts i if i.odd? # or if i%2 != 0
end
 # 10*
 friends = ['Sarah', 'John', 'Hannah', 'Dave']

 for i in 0..3
  puts "Hello, #{friends[i]}!"
 end

 # *BETTER LS APPROACH:
for friend in friends # friend is arbitrary, could be n in friends
  puts "Hello, #{friend}!"
end

# LOOPS 2

# 1. 
count = 1

loop do
  if count.even? 
    puts "#{count} is even!"
  else
    puts "#{count} is odd!"
  end
  count += 1
  break if count > 5 # would be == 5 if this line was above the count += 1 line
end

# 2. 
loop do
  number = rand(100)
  puts number
  break if number <= 10
end

# 3. 
process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
  else
    puts "The loop wasn't processed!"
  end

 # OR

process_the_loop = [true, false].sample

loop do
  puts process_the_loop ? "The loop was processed!" : "The loop wasn't processed!"
  break
end

# 4. 
loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4
    puts "That's correct!"
    break
  else
    puts "Wrong answer. Try again!"
  end
end

 # 5.
 numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input
  break if numbers.size == 5
end

puts numbers

# 6. 
names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names.shift # SHIFT returns and deletes first item, POP returns and deletes last item
  break if names.empty?
end

# 7. 

5.times do |index|
  puts index
  break if index == 2
end

# 8. 
number = 0

until number == 10
  number += 1
  puts number if number.even?
end

# 9. 

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5 # NEXT skips to the next iteration. Ignores code below and starts over,
  puts "5 was reached!"
  break
end

# 10. 

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end

# USER INPUT

# 1.
puts ">> Type anything you want."
answer = gets.chomp
puts answer

# 2.
puts ">> What is your age?"
age = gets.chomp.to_i
puts "You are #{age*12} months old!"

# 3. 
 puts ">> Do you want me to print something? (y/n)"
 answer = gets.chomp.downcase
 puts "something" if answer == "y"

 # 4.

 loop do
  puts ">> Do you want me to print something? (y/n)"
  answer = gets.chomp.downcase
  if answer == "y"
    puts "something"
    break
  elsif answer == "n"
    break
  else
    puts "Try again. Please answer y or n."
  end
 end

 # 5.
 loop do
  puts ">> How many output lines do you want? Enter a number >= 3"
  lines = gets.chomp.to_i
  if lines > 2
    lines.times { puts "Launch School is the best!" }
    break
  else
    puts "Please try again. Enter a number > or = to 3."
  end
 end

# OR

lines = nil

 loop do
  puts ">> How many output lines do you want? Enter a number >= 3"
  lines = gets.chomp.to_i
  break if lines > 2
  puts "Please try again. Enter a number > or = to 3."
 end

lines.times { puts "Launch School is the best!" }

# 6. 

PASSWORD = "launch"

loop do
  puts ">> Please enter your password"
  pass = gets.chomp
  break if pass == PASSWORD
  puts "Invalid password!"
end

puts "Welcome!"

# OR

loop do
  puts ">> Please enter your password"
  pass = gets.chomp
  if pass == PASSWORD
    puts "Welcome!"
    break
  else
    puts "Invalid password!"
  end
end

# 7.
PASSWORD = "launch"
USERNAME = "student"

loop do
  puts ">> Please enter your username:"
  user = gets.chomp
  puts ">> Please enter your password:"
  pass = gets.chomp
  break if user == USERNAME && pass == PASSWORD
  puts "Authorization failed! Username or password is incorrect."
end

puts "Welcome!"

# 8. 
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

num = nil
den = nil

loop do
  puts ">> Please enter the numerator:"
  num = gets.chomp
  break if valid_number?(num)
  puts ">> Invalid input. Only integers are allowed."
end

loop do
  puts ">> Please enter the denominator:"
  den = gets.chomp
  break if valid_number?(den) && den != "0" # FIXED: needed to put 0 in quotes because it's a string at this point
  if den == "0" # FIXED: needed to put 0 in quotes because it's a string at this point
    puts ">> Invalid input. A denominator of 0 is not allowed."
  else
    puts ">> Invalid input. Only integers are allowed."
  end
end

ans = num.to_i / den.to_i
puts "#{num} / #{den} is #{ans}"

# 9. *
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def get_num
  loop do
    puts ">> Please enter a positive or negative integer:"
    num = gets.chomp
    return num.to_i if valid_number?(num) # using break does not return value
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
end

num1 = nil # need to define outside loop since we reference it outside of loop later
num2 = nil # need to define outside loop since we reference it outside of loop later

loop do
  num1 = get_num
  num2 = get_num
  break if num1 * num2 < 0
  puts ">> Sorry. One integer must be positive, one must be negative."
  puts ">> Please start over."
end

ans = num1 + num2
puts "#{num1} + #{num2} = #{ans}"

# METHODS
# 1.

def print_me
  puts "I'm printing from inside the method!"
end

# 2.

def print_me
  "I'm printing the return value!"
end

puts print_me

# 3.

def hello
  "Hello"
end

def world
  "World"
end

puts hello + " " + world

# 4.
def car(make, model)
  puts "#{make} #{model}"
end

car('Toyota', 'Corolla')

# 5.
daylight = [true, false].sample

def time_of_day(tf)
  puts "It's daytime!" if tf == true
  puts "It's nighttime!" if tf == false
end

time_of_day(daylight)

# 6. 
def assign_name(name = "Bob")
  name
end

puts assign_name('Kevin')
puts assign_name

# 7.

def add(n1, n2)
  n1 + n2
end

def multiply(n1, n2)
  n1 * n2
end 

# 8.
def name(arr)
  arr.sample
end

def activity(arr)
  arr.sample
end

def sentence(name, activity)
  "#{name} was #{activity} earlier!"
end 

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

puts sentence(name(names), activity(activities))

# CONDITIONALS

# 1.
sun = ['visible', 'hidden'].sample

if sun == "visible"
  puts "The sun is so bright!"
end

# 2.
sun = ['visible', 'hidden'].sample

unless sun == "visible"
  puts "The clouds are blocking the sun!"
end

# 3.
sun = ['visible', 'hidden'].sample
puts "The clouds are blocking the sun!" unless sun == "visible"
puts "The sun is so bright!" if sun == "visible"


# 4.
boolean = [true, false].sample

puts boolean ? "I'm true!" : "I'm false!"

# 5.
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when "green"
  puts "Go!"
when "yellow"
  puts "Slow down!"
when "red"
  puts "Stop!"
else
  puts "The lights aren't working"
end

# ARRAYS
# 1.
numbers = [1, 2, 3, 4, 5]

doubled = numbers.map { |number| number * 2 }

p doubled

# 2.
numbers = [5, 9, 21, 26, 39]

divisible_by_three = numbers.select { |n| n % 3 == 0 }

p divisible_by_three

# 3.

d = ['Dave', 7]
m = ['Miranda', 3]
j = ['Jason', 11]

favorites = [d, m, j]

p favorites.flatten

# 4.
array1 = [1, 5, 9]
array2 = [1, 9, 5]

p array1.eql?(array2)
p array1 == array2


# HASHES
# 1.
car = {
  type: "sedan",
  color: "blue",
  mileage: 80_000
}
# 2.
car[:year] = 2003

# 3.
car.delete(:mileage)

# 4.
puts "The car is #{car[:color]}."

# 5.
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

numbers.each do |key, value|
  puts "A #{key} number is #{value}"
end

# 6.
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

half_numbers = numbers.map {|key, value| value / 2 }

# 7.
numbers = {
  high:   100,
  medium: 50,
  low:    10
}

low_numbers = numbers.select! {|key, value| value < 25 }
p low_numbers
p numbers

# 8.

auto = {
  car: {type: "sedan", color: "blue", year: 2003},
  truck: {type: "pickup", color: "red", year: 1998}
  
}

# 9. 
car = {
  type:  'sedan',
  color: 'blue',
  year:  2003
}

car_arr = [[:type, "sedan"], [:color, "blue"], [:year, 2003]]

# OR

p car.to_a # TRANSFORMS TO ARRAY
