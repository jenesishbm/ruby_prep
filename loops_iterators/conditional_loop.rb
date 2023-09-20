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