# FLOW CONTROL

# case statement
a = 5

case a #only need to specify the variable once using case
when 5 #when a is 5, do the following
  puts "a is 5"
when 6 #when a is 6, do the following
  puts "a is 6"
else #otherwise, do the following
  puts "a is neither 5 nor 6"
end #end process

# case statement refactored to minimize number of times we call puts

b = 7

answer = case b
  when 5
    "b is 5"
  when 6
    "b is 6"
  else
    "b is neither 5, nor 6"
  end

puts answer

# case with no argument statement

a = 5

case
when a == 5
  puts "a is 5"
when a == 6
  puts "a is 6"
else
  puts "a is neither 5, nor 6"
end

# my example with strings

name = "bob"

case name
when "jenesis"
  puts "Hi jenesis, welcome back"
when "justice"
  puts "Hi justice, welcome back"
when "jewel"
  puts "Hi jewel, welcome back"
else 
  puts "What are you doing here?"
end