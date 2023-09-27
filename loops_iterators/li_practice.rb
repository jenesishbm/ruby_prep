# 1. What does the each method in the following program return after it is finished executing?

x = [1, 2, 3, 4, 5]
x.each do |a|
  a + 1
end

# 1, 2, 3, 4, 5 -> .each will always return the original array it was called on

# 2. Write a while loop that takes input from the user, performs an action, and only stops when the user types "STOP". Each loop can get info from the user.

# general answer
x = gets.chomp

while x != "STOP" do
  puts x
  x = gets.chomp
end

# LS solution
x = ""
while x != "STOP" do
  puts "Hi, How are you feeling?"
  ans = gets.chomp
  puts "Want me to ask you again?"
  x = gets.chomp
end

# 3. Write a method that counts down to zero using recursion.

def count(number)
  if number <= 0
    puts number # once number <= 0, print number and exit the method
  else
    puts number
    count(number - 1) # countdown by 1 until number <= 0
  end
end

count(9)