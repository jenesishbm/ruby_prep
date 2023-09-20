# FLOW CONTROL EXERCISES

#1. Write down whether the following expressions return true or false. Then type the expressions into irb to see the results.
(32 * 4) >= 129 #false
false != !true #false
true == 4 #false
true == !!4 #true
false == (847 == '847') #true
(!true || (!(100 / 5) == 20) || ((328 / 4) == 82)) || false #true

#2. Write a method that takes a string as an argument. 
#The method should return a new, all-caps version of the string, only if the string is longer than 10 characters. 
# Example: change "hello world" to "HELLO WORLD". (Hint: Ruby's String class has a few methods that would be helpful. Check the Ruby Docs!)

def caps(string)
  if string.length > 10
    string.upcase
  else
    "Sorry, this string is too short."
  end #need to end the if/else statement before ending the method block
end

  puts caps("hello my friend")

# 3. Write a program that takes a number from the user between 0 and 100 and reports back whether the number is between 0 and 50, 51 and 100, or above 100.

puts "Give me a number between 0 and 100"

num = gets.chomp.to_i

if num >= 0 && num <= 50
  puts "Your number is between 0 and 50"
elsif num >= 50 && num <= 100
  puts "Your number is between 51 and 100"
else
  puts "Your number is below 0 or above 100"
end

# Alternative solution for 3

puts "Please enter a number between 0 and 100."
number = gets.chomp.to_i

if number < 0
  puts "You can't enter a negative number!"
elsif number <= 50
  puts "#{number} is between 0 and 50"
elsif number <= 100
  puts "#{number} is between 51 and 100"
else
  puts "#{number} is above 100"
end

# 4. What will each block of code below print to the screen?

# Snippet 1
'4' == 4 ? puts("TRUE") : puts("FALSE") # FALSE

# Snippet 2
x = 2
if ((x * 3) / 2) == (4 + 4 - x - 3)
  puts "Did you get it right?"
else
  puts "Did you?"
end # Did you get it right?

# Snippet 3
y = 9
x = 10
if (x + 1) <= (y)
  puts "Alright."
elsif (x + 1) >= (y)
  puts "Alright now!"
elsif (y + 1) == x
  puts "ALRIGHT NOW!"
else
  puts "Alrighty!"
end # Alright now!


# 5. Reminder that you need an end statement to end if/else and another end statement to end a method definition block.

# 6. Write down whether the following expressions return true or false or raise an error. Then, type the expressions into irb to see the results.

(32 * 4) >= "129" #error because you can't compare string with an integer
847 == '847' #false
'847' < '846' #false
'847' > '846' #true
'847' > '8478' #false
'847' < '8478' #true, compares string values one by one left to right