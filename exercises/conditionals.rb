## CONDITIONALS

# 1. In the code below, sun is randomly assigned as 'visible' or 'hidden'. Write an if statement that prints "The sun is so bright!" if sun equals 'visible'.

sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == "visible" # one line

if sun == "visible"
  puts "The sun is so bright!" # multi-line
end

# 2. Write an unless statement that prints "The clouds are blocking the sun!" unless sun equals 'visible'.
sun = ['visible', 'hidden'].sample

puts "The clouds are blocking the sun!" unless sun == "visible"

# 3. Write an if statement that prints "The sun is so bright!" if sun equals visible. Also, write an unless statement that prints "The clouds are blocking the sun!" unless sun equals visible.
sun = ['visible', 'hidden'].sample

puts "The sun is so bright!" if sun == "visible"
puts "The clouds are blocking the sun!" unless sun == "visible"

# 4. Write a ternary operator that prints "I'm true!" if boolean equals true and prints "I'm false!" if boolean equals false.
boolean = [true, false].sample

puts (boolean ? "I'm true!" : "I'm false!")
# syntax: <condition> ? <result if true> : <result if false>

# 5. What will the following code print? Why? Don't run it until you've attempted to answer.

number = 7

if number
  puts "My favorite number is #{number}."
else
  puts "I don't have a favorite number."
end

# This will print "My favorite number is 7" because numbers are truthy.
# NOTE: In Ruby, every expression except false and nil evaluates as true when used in a condition. 

# 6. Write a case statement that prints "Go!" if stoplight equals 'green', "Slow down!" if stoplight equals 'yellow', and "Stop!" if stoplight equals 'red'.
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
when "green"
  puts "Go!"
when "yellow"
  puts "Slow down!"
when "red"
  puts "Stop!"
end

# 7. Convert the case statement above to an if statement.
stoplight = ['green', 'yellow', 'red'].sample

if stoplight == "green"
  puts "Go!"
elsif stoplight == "yellow"
  puts "Slow down!"
else
  puts "Stop!"
end

# 8. Write an if statement that returns "Be productive!" if status equals 'awake' and returns "Go to sleep!" otherwise. Then, assign the return value of the if statement to a variable and print that variable.
status = ['awake', 'tired'].sample

if status == "awake"
  result = "Be productive!"
else
  result = "Go to sleep!"
end

puts result

# LS / or:

alert = if status == 'awake'
  'Be productive!'
else
  'Go to sleep!'
end

puts alert

# 9. Currently, "5 is a cool number!" is being printed every time the program is run. Fix the code so that "Other numbers are cool too!" gets a chance to be executed.

number = rand(10)

if number == 5 # instead of number = 5. = is for assignment. == is for comparison.
  puts '5 is a cool number!'
else
  puts 'Other numbers are cool too!'
end

#10. Reformat the following case statement so that it only takes up 5 lines.
stoplight = ['green', 'yellow', 'red'].sample

case stoplight
  when 'green' then puts 'Go!'
  when 'yellow' then puts 'Slow down!' 
  else puts 'Stop!'
end
