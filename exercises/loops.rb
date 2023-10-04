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