# VARIABLES

# 1. Write a program called name.rb that asks the user to type in their name and then prints out a greeting message with their name included.
puts "What is your name?"
name = gets.chomp
puts "Hello " + name

puts "Here is your name 10 times:"
10.times { puts name }