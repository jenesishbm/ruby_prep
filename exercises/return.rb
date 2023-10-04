## READING DOCUMENTATION 2

# 1. How would you use String#upcase to create an uppercase version of the string "xyz"?
print "xyz".upcase

# 2. How would you use Array#insert to insert the numbers 5, 6, and 7 between the elements with values 'c' and 'd'?
a = %w(a b c d e)
a.insert(3, 5, 6, 7)

# 3. Assume you have the following code. What will each of the 3 puts statements print?

s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect #["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]
puts s.split(',').inspect #["abc def ghi" , "jkl mno pqr" , "stu vwx yz"]
puts s.split(',', 2).inspect #["abc def ghi" , "jkl mno pqr,stu vwx yz"]

## VARIABLE SCOPE

# 1. What will the following code print and why? Don't run it until you have tried to answer.

a = 7

def my_value(b)
  b += 10
end

my_value(a) #17
puts a #7

=begin
This code will print 7. Numbers in Ruby are immutable. 
Thus, there is no way for my_value to mutate the value referenced by b, which means that my_value does not (and can not) change the object referenced by a (7).
=end

# 2. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(a)
  a += 10
end

my_value(a) #17
puts a #7

=begin
This code will print 7 again. Numbers in Ruby are immutable. Thus, there is no way for my_value to mutate the value referenced by a, which means that my_value does not (and can not) change the object referenced by a (7).
=end

# 3. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  a = b
end

my_value(a + 5) #12
puts a #7

=begin
This code will print 7 again. Outside of the method, a is still unchanged and equal to 7.
LS: Once again, the result is 7. Once again, the local variable a inside the my_value method definition is not visible outside the my_value method definition. Furthermore, the local variable a at the top level is not visible inside my_value because method definitions are self-contained with respect to local variables.
=end

# 4. What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a #"Xy-zy"

=begin
This code will print Xy-zy. Strings are mutable - they can be modified - and, in particular, the method String#[]= is a mutating method; it actually modifies the string. 
Since we are actually modifying the string referenced by b, and b references the same string as a, the result from printing a shows an update to the value of the string.
=end

# 5. What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

=begin
This code will print "Xyzzy". Assignment never changes the value of an object; instead, it creates a new object, and then stores a reference to that object in the variable on the left. So, at the end of my_value, b references the string 'yzzyX', while a remains unchanged: it still references "Xyzzy".

So, how does this differ from b[2] = '-' in the question above? The key difference with b[2] = '-' is that this is not quite the same as object assignment; it is a call to a method named []=, and this method mutates the String referenced by b; it does not change what object b references, so a continues to reference the modified String.
To summarize, assignment to a variable (an object) never mutates the object that is referenced. However, don't take that too far: if you assign to b[2] like we did in the previous exercise, that's a completely different operation; that actually mutates the content of the String referenced by b.
=end

# 6. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  b = a + a
end

my_value(a) #14
puts a #7

=begin
This returns an ERROR message since a is not defined inside the method. In other words, even though we define a above the method, inside the method has no idea what a is. Therefore, it is unable to execute.
LS: Even though a is defined before my_value is defined, it is not visible inside my_value. Method definitions are self contained with respect to local variables. Local variables initialized inside the method definition are not visible outside the method definition, and local variables initialized outside the method definition are not visible inside the method definition.
=end

# 7. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element #3
end

puts a #3

=begin
This code will print 3. The code re-assigns a to each element of the array, which ends with 3.

LS: We are now dealing with a method invocation that has a block. The scoping rules for a method invocation with a block differ from the rules for method definitions. 
With method definitions, local variable scope is restricted to the method definition itself. In contrast, a method invocation with a block has more open scoping rules; 
the block can use and modify local variables that are defined outside the block.
In this case, a starts out as 7, then we set a to 1, 2 and 3 in sequence. By the time we get to the puts, a has a value of 3.
=end

# 8. What will the following code print, and why? Don't run the code until you have tried to answer.

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# This will return an error. A is not defined outside of the block so it cannot be printed outside of the block.

# 9. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

=begin 
This will print 7. In the block, a refers to elements of the array. Outside of the block, a remans unchanged (=7).
The array, on the other hand, would be modified in the block to 2, 3, 4.

LS: This problem demonstrates shadowing. Shadowing occurs when a block parameter hides a local variable that is defined outside the block. Since the outer a is shadowed, the a += 1 has no effect on it. In fact, that statement has no effect at all.
=end

# 10. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a

=begin
This will return an error. A is not defined inside the method.
LS: This returns an error. a at the top level is not visible inside the invocation of the each method with a block because the invocation of each is inside my_value, and method definitions are self-contained with respect to local variables. Since the outer a is not visible inside the my_value method definition, it isn't visible inside the method invocation with a block.
*Methods are entirely self-contained. Need to define a in the method to avoid this type of error.*
=end

## LOOPS 1

# 1. The code below is an example of an infinite loop. Modify the code so the loop stops after the first iteration.

loop do
  puts 'Just keep printing...'
  break #added
end

# 2. The code below is an example of a nested loop. Both loops currently loop infinitely. Modify the code so each loop stops after the first iteration.

loop do
  puts 'This is the outer loop.'

  loop do
    puts 'This is the inner loop.'
    break #added
  end

  break #added
end

puts 'This is outside all loops.'

# 3. Modify the following loop so it iterates 5 times instead of just once.

iterations = 0

loop do
  puts "Number of iterations = #{iterations+=1}" until iterations == 5
  break
end

# LS:
iterations = 1

loop do
  puts "Number of iterations = #{iterations}"
  iterations += 1
  break if iterations > 5
end

# 4. Modify the code below so the loop stops iterating when the user inputs 'yes'.

loop do
  puts 'Should I stop looping?'
  answer = gets.chomp.downcase #add .downcase so it's not case sensitives
  break if answer == "yes" #add
  puts 'Incorrect answer. Please answer "yes" to stop.' #LS add
end

# 5. Modify the code below so "Hello!" is printed 5 times.

say_hello = true
counter = 0

while say_hello
  puts 'Hello!'
  counter += 1
  say_hello = false if counter == 5
end

# 6. Using a while loop, print 5 random numbers between 0 and 99 (inclusive). The code below shows an example of how to begin solving this exercise.

numbers = []

while numbers.size < 5
  numbers << rand(100) # generates a random number between 0 and less than indicated (number)
end

puts numbers

# 7. The following code outputs a countdown from 10 to 1. Modify the code so that it counts from 1 to 10 instead.

count = 0

until count == 10
  count += 1
  puts count
end

# 8. Given the array of several numbers below, use an until loop to print each number.

numbers = [7, 9, 13, 25, 18]
idx = 0

until idx == numbers.size #this works because the index of the array will always be one less than the size of the array
  puts numbers[idx]
  idx += 1
end

# 9. The code below shows an example of a for loop. Modify the code so that it only outputs i if i is an odd number.

for i in 1..100
  puts i if i.odd? #my original approach was using if i % 2 != 0 but this approach is simpler
end

# 10. Your friends just showed up! Given the following array of names, use a for loop to greet each friend individually.

friends = ['Sarah', 'John', 'Hannah', 'Dave']

# me
for i in 0...friends.size
  puts "Hello, #{friends[i]}"
end

#LS (better)
for friend in friends
  puts "Hello, #{friend}!"
end

## LOOPS 2

# 1. Write a loop that prints numbers 1-5 and whether the number is even or odd. Use the code below to get started.

count = 1

loop do
  puts "#{count} is odd!" if count.odd?
  puts "#{count} is even!" if count.even?
  count += 1
  break if count > 5 # would be break if count == 5 IF this came before the count +=1 line
end

# NOTE: always be aware of where you are incrementing your count variable and where you are enforcing the break/until/while statement.

# 2. Modify the following code so that the loop stops if number is equal to or between 0 and 10.

loop do
  number = rand(100)
  puts number
  break if number <= 10 # rand already has a lower limit inclusive of 0. Another option is break if number.between?(0, 10)
end

# 3. Write an if/else statement that executes some code if the process_the_loop variable is true and some other code when process_the_loop is false. Specifically:

process_the_loop = [true, false].sample

if process_the_loop
  loop do
    puts "The loop was processed!"
    break
  end
else 
  puts "The loop was not processed!"
end

# 4. The code below asks the user "What does 2 + 2 equal?" and uses #gets to retrieve the user's answer. Modify the code so "That's correct!" is printed and the loop stops when the user's answer equals 4. Print "Wrong answer. Try again!" if the user's answer doesn't equal 4.

loop do
  puts 'What does 2 + 2 equal?'
  answer = gets.chomp.to_i
  if answer == 4 #added
    puts "That's correct!" #added
    break #added
  else #added
    puts "Wrong answer. Try again!" #added
  end #added
end

# 5. Modify the code below so that the user's input gets added to the numbers array. Stop the loop when the array contains 5 numbers.

numbers = []

loop do
  puts 'Enter any number:'
  input = gets.chomp.to_i
  numbers << input # can also use numbers.push(input)
  break if numbers.length == 5
end
puts numbers

# 6. Given the array below, use loop to remove and print each name from first to last. Stop the loop once names doesn't contain any more elements.

names = ['Sally', 'Joe', 'Lisa', 'Henry']

loop do
  puts names[0] #prints the first element in an array
  names.shift # deletes the first element in an array
  break if names.length == 0
end

# LS alternative solution:

loop do
  puts names.shift # .shift() prints first element and deletes it
  break if names.empty? # checks if array is empty (true or false)
end

# Extra practice: in reverse
loop do
  puts names.pop # .pop() prints last element and deletes it
  break if names.empty?
end

# 7. The method below counts from 0 to 4. Modify the block so that it prints the current number and stops iterating when the current number equals 2.

5.times do |index|
  puts index
  break if index == 2
end

# 8. Using next, modify the code below so that it only prints positive integers that are even.

number = 0

until number == 10
  number += 1
  next if number.odd? # skips code below next if number is odd
  puts number
end

# 9. The following code increments number_a and number_b by either 0 or 1. loop is used so that the variables can be incremented more than once, however, break stops the loop after the first iteration. Use next to modify the code so that the loop iterates until either number_a or number_b equals 5. Print "5 was reached!" before breaking out of the loop.

number_a = 0
number_b = 0

loop do
  number_a += rand(2)
  number_b += rand(2)
  next unless number_a == 5 || number_b == 5 # next UNLESS, not next IF. Skips code below UNLESS number = 5
  puts "5 was reached!"
  break
end

# 10. Given the code below, use a while loop to print "Hello!" twice.

def greeting
  puts 'Hello!'
end

number_of_greetings = 2

while number_of_greetings > 0
  greeting
  number_of_greetings -= 1
end

## USER INPUT

# 1. Write a program that asks the user to type something in, after which your program should simply display what was entered.

puts ">> Type anything you want"
answer = gets.chomp
puts answer

# 2. Write a program that asks the user for their age in years, and then converts that age to months.
puts ">> What is your age in years?"
age = gets.chomp.to_i
puts "You are #{age*12} months old"

# 3. Write a program that asks the user whether they want the program to print "something", then print it if the user enters y. Otherwise, print nothing.

puts ">> Do you want me to print something? (y/n)"
choice = gets.chomp.downcase
puts "something" if choice == "y"

# 4. Modify your program so it prints an error message for any inputs that aren't y or n, and then asks you to try again. Keep asking for a response until you receive a valid y or n response.

loop do
  puts ">> Do you want me to print something? (y/n)"
  choice = gets.chomp.downcase
  if choice == "y"
    puts "something"
    break
  elsif choice == "n"
    break
  else
    puts "Error: Answer must be y or n. Try again."
  end
end

# LS solution:

choice = nil #define choice outside of loop so we can use it in last line

loop do
  puts '>> Do you want me to print something? (y/n)'
  choice = gets.chomp.downcase
  break if ["y", "n"].include?(choice) #break if choice is included in the array ["y", "n"]
  puts '>> Invalid input! Please enter y or n'
end
puts 'something' if choice == 'y'

# 5. Write a program that prints 'Launch School is the best!' repeatedly until a certain number of lines have been printed. The program should obtain the number of lines from the user, and should insist that at least 3 lines are printed.

loop do
  puts ">> How many output lines do you want? Please enter a number >= 3."
  lines = gets.chomp.to_i
  if lines >= 3
    lines.times { puts "Launch School is the best!" }
    break
  else puts "Please try again with a number greater than 3."
  end
end

# 6. Write a program that displays a welcome message, but only after the user enters the correct password, where the password is a string that is defined as a constant in your program. Keep asking for the password until the user enters the correct password.

PASSWORD = "launchschool123"

loop do
  puts ">> Please enter password:"
  pass = gets.chomp
  if pass == PASSWORD
    puts "Welcome back, launch school student!"
    break 
  end
end

# 7. In the previous exercise, you wrote a program to solicit a password. In this exercise, you should modify the program so it also requires a user name. The program should solicit both the user name and the password, then validate both, and issue a generic error message if one or both are incorrect; the error message should not tell the user which item is incorrect.

USERNAME = "jenesis"
PASSWORD = "launchschool123"

loop do
  puts ">> Please enter user name:"
  user = gets.chomp

  puts " >> Please enter password:"
  pass = gets.chomp

  if user == USERNAME && pass == PASSWORD
    puts "Welcome back, launch school student!"
    break 
  else puts "Authorization failed! Try again"
  end
end

# 8. Write a program that asks the user to enter two integers, then prints the results of dividing the first by the second. The second number must not be 0. Since this is user input, there's a good chance that the user won't enter a valid integer. Therefore, you must validate the input to be sure it is an integer. You can use the following code to determine whether the input is an integer:
def valid_number?(number_string)
  number_string.to_i.to_s == number_string
end

num = nil #must define variables outside each loop so they can be used in other loops
den = nil #i.e. so that the denominator loop can call the num variable
result = nil

loop do
  puts ">> Please enter the numerator"
  num = gets.chomp
  break if valid_number?(num)
  puts "Invalid input. Only integers are allowed."
end

loop do
  puts ">> Please enter the denominator"
  den = gets.chomp
  if den != "0" && valid_number?(den)
    result = num.to_i.div(den.to_i)
    puts "#{num} / #{den} is #{result}"
  break
  else puts "Invalid input. Only non-zero integers are allowed."
  end
end

# 9. Modify the program from #5. so it repeats itself after each input/print iteration, asking for a new number each time through. The program should keep running until the user enters q or Q.

loop do
  puts ">> How many output lines do you want? Please enter a number >= 3 (Q to quit)."
  lines = gets.chomp
  if lines.to_i >= 3
    lines.to_i.times { puts "Launch School is the best!" }
  elsif lines.downcase == "q"
    break
  else puts "That's not enough lines! Please try again with a number >= 3."
  end
end

# 10. Write a program that requests two integers from the user, adds them together, and then displays the result. Furthermore, insist that one of the integers be positive, and one negative; however, the order in which the two integers are entered does not matter.

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

first = nil
second = nil
sum = nil

loop do
  puts ">> Please enter a positive or negative integer."
  first = gets.chomp

  if valid_number?(first)
    puts ">> Please enter another positive or negative integer."
    second = gets.chomp
  else puts ">> Invalid input. Only non-zero integers are allowed."
  end

  if valid_number?(second) && (first.to_i * second.to_i < 0)
    break
  elsif valid_number?(second) == false
    puts ">> Invalid input. Only non-zero integers are allowed."
    puts ">> Please enter another positive or negative integer."
    second = gets.chomp
    break if valid_number?(second)
  else
    puts ">> Sorry. One integer must be positive, one must be negative."
    puts ">> Please start over."
  end
end

sum = first.to_i + second.to_i
puts "#{first} + #{second} = #{sum}"


# LS solution using a METHOD:

def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

def read_number # method to collect input and make sure it's a valid integer
  loop do
    puts '>> Please enter a positive or negative integer:'
    number = gets.chomp
    return number.to_i if valid_number?(number) # breaks the loop
    puts '>> Invalid input. Only non-zero integers are allowed.'
  end
end

first_number = nil
second_number = nil

loop do
  first_number = read_number # collect integer one
  second_number = read_number # collect integer two
  break if first_number * second_number < 0 # break loop if one is negative
  puts '>> Sorry. One integer must be positive, one must be negative.'
  puts '>> Please start over.' # if not, starts over
end

sum = first_number + second_number
puts "#{first_number} + #{second_number} = #{sum}"

## METHODS

# 1. Write a method named print_me that prints I'm printing within the method! when invoked as follows:
def print_me
  puts "I'm printing within the method!" #prints string but returns nil
end

print_me

# 2. Write a method named print_me so that I'm printing the return value! is printed when running the following code:
def print_me
  "I'm printing the return value"
end

puts print_me

# 3. Write two methods, one that returns the string "Hello" and one that returns the string "World". Then print both strings using #puts, combining them into one sentence.
 
def hello
  "Hello"
end

def world
  "World"
end

puts hello + " " + world
puts "#{hello} #{world}"

# 4. Write a method named greet that invokes the hello and world methods:

def hello
  "Hello"
end

def world
  "World"
end

def greet
  "#{hello} #{world}"
  # or hello + " " + world
end

puts greet

# 5. Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.
def car(make, model)
  puts make + " " + model
end

car('Toyota', 'Corolla')

# 6. The variable below will be randomly assigned as true or false. Write a method named time_of_day that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false. Pass daylight into the method as the argument to determine whether it's day or night.

daylight = [true, false].sample

def time_of_day(boolean)
  puts "It's daytime!" if true
  puts "It's nighttime!" if false
end

time_of_day(daylight)

# 7. Update the below method definitions and method invocations as necessary so that the names are printed as shown:
def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."

# 8. Write a method that accepts one argument, but doesn't require it. The parameter should default to the string "Bob" if no argument is given. The method's return value should be the value of the argument.
def assign_name(name = "Bob")
  return name
end

puts assign_name('Kevin') == 'Kevin' # true
puts assign_name == 'Bob' # true

# 9. Write the following methods so that each output is true.
def add(one, two)
  one + two
end

def multiply(one, two)
  one * two
end

puts add(2, 2) == 4 #true
puts add(5, 4) == 9 #true
puts multiply(add(2, 2), add(5, 4)) == 36 #true

# 10. The variables below are both assigned to arrays. The first one, names, contains a list of names. The second one, activities, contains a list of activities. Write the methods name and activity so that they each take the appropriate array and return a random value from it. Then write the method sentence that combines both values into a sentence and returns it from the method.

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(arr = names)
  arr.sample # pick a random value from array
end

def activity(arr = activities)
  arr.sample # pick a random value from array
end

def sentence(name, activity)
  "#{name} was #{activity} today!"
end

puts name(names)
puts activity(activities)
puts sentence(name(names), activity(activities))

## RETURN
# 1. What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  return 'Breakfast'
end

puts meal # Breakfast

# 2. What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  'Evening' # the return value of a method in ruby is the evaluated result of the last line in the method
end

puts meal # Evening

# 3. What will the following code print? Why? Don't run it until you've attempted to answer.
def meal
  return 'Breakfast'
  'Dinner'
end

puts meal # Breakfast - return causes a method to return specified value then exit method

# 4. What will the following code print? Why? Don't run it until you've attempted to answer.
def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal #Dinner and Breakfast. Dinner from inside the method. Breakfast from outside.

# 5. What will the following code print? Why? Don't run it until you've attempted to answer.
#REVIEW: got this wrong
def meal
  'Dinner'
  puts 'Dinner'
end

p meal # Dinner nil. The method prints dinner and p prints nil since puts is the last line evaluated in the method (returns nil). 

# 6. What will the following code print? Why? Don't run it until you've attempted to answer.
def meal
  return 'Breakfast' # return immediately exits the method and returns the provided value
  'Dinner'
  puts 'Dinner'
end

puts meal # Breakfast

# 7. What will the following code print? Why? Don't run it until you've attempted to answer.
#REVIEW: got this wrong
def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep # WRONG: the method will print sheep 5 times and this line will print nothing because the method returns nil. WRONG because sheep is not in quotes, it's a placeholder and .times() is an integer method starting at 0. Read the ruby docs next time.
 
# LS: the .times method iterated 5 times (prints 0 - 4) and returned the initial integer, 5, which puts printed.

=begin
Correct answer: We're using Integer#times within the count_sheep method to count from 0 to 4 (#times starts at 0). 
Therefore, it's no surprise that the output includes 0 through 4. What may be surprising, however, is the fact that the output includes 5. 
Where did that 5 come from? If you study #times in the Ruby docs, you'll know that after iterating 5 times, the block returns the initial integer. 
Which, in this case, is 5.
We can use this knowledge combined with what we learned from the previous exercises to determine why 5 was printed. 
When looking at count_sheep we can see that the #times block is the only code in the method. This means it's also the last line in the method. 
Since #times returns the initial integer, we now know that the return value of count_sheep is 5.
=end

# 8. What will the following code print? Why? Don't run it until you've attempted to answer.
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep # This code will print 0, 1, 2, 3, 4 from inside the method and 10 from outside the method. 0 1 2 3 4 10

# 9. What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

# The method will print 0, 1, 2, nil. The method will break after it prints 2 and p will print nil outside the method since the method returned nil (nothing specified after return).

# 10. What will the following code print? Why? Don't run it until you've attempted to answer.
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number # nil. Default boolean is true which sets number to 1 (but doesn't return anything) before exiting.
