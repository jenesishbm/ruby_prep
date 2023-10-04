# 10. with no start over
def valid_number?(number_string)
  number_string.to_i.to_s == number_string && number_string.to_i != 0
end

first = nil
second = nil
sum = nil

# without starting over
=begin
loop do
  puts ">> Please enter a positive or negative integer."
  first = gets.chomp
  if valid_number?(first)
    break
  else 
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
end

loop do
  puts ">> Please enter a positive or negative integer."
  second = gets.chomp
  if valid_number?(second)
    break
  else 
    puts ">> Invalid input. Only non-zero integers are allowed."
  end
end

if first.to_i > 0 && second.to_i < 0 || first.to_i < 0 && second.to_i > 0
  sum = first.to_i + second.to_i
  puts "#{first} + #{second} = #{sum}"
else
  puts "Sorry. One integer must be positive, one must be negative."
  puts "Please start over."
end
=end

# 10. Complete solution
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