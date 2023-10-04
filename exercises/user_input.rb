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