# conditional loop

i = 0
loop do
  i = i + 2
  puts i
  if i == 10
    break
  end
end

# conditional loop using next to skip iteration

i = 0
loop do
  i = i + 2
  if i == 4
    next #skips rest of the code in this iteration
  end
  puts i
  if i == 10
    break
  end
end

# conditional_while_loop.rb

x = 0

while x <= 10
  if x.odd?
    puts x
  end
  x += 1
end # retuns 1, 3, 5, 7, 9

# conditional_while_loop_with_next.rb

x = 0

while x <= 10
  if x == 3
    x += 1
    next
  elsif x.odd?
    puts x
  end
  x += 1
end # skips 3 and returns 1, 5, 7, 9

# conditional_while_loop_with_break.rb

x = 0

while x <= 10
  if x == 7
    break
  elsif x.odd?
    puts x
  end
  x += 1
end # quits loop once x is 7 and returns 1, 3, 5