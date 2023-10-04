## RETURN
# 1. What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  return 'Breakfast'
end

puts meal # Breakfast

# 2. What will the following code print? Why? Don't run it until you've attempted to answer.

def meal
  'Evening' # the return value of a method in ruby is the evaluated result of the last line in the method
end

puts meal # Evening

# 3. What will the following code print? Why? Don't run it until you've attempted to answer.
def meal
  return 'Breakfast'
  'Dinner'
end

puts meal # Breakfast - return causes a method to return specified value then exit method

# 4. What will the following code print? Why? Don't run it until you've attempted to answer.
def meal
  puts 'Dinner'
  return 'Breakfast'
end

puts meal #Dinner and Breakfast. Dinner from inside the method. Breakfast from outside.

# 5. What will the following code print? Why? Don't run it until you've attempted to answer.
#REVIEW: got this wrong
def meal
  'Dinner'
  puts 'Dinner'
end

p meal # Dinner nil. The method prints dinner and p prints nil since puts is the last line evaluated in the method (returns nil). 

# 6. What will the following code print? Why? Don't run it until you've attempted to answer.
def meal
  return 'Breakfast' # return immediately exits the method and returns the provided value
  'Dinner'
  puts 'Dinner'
end

puts meal # Breakfast

# 7. What will the following code print? Why? Don't run it until you've attempted to answer.
#REVIEW: got this wrong
def count_sheep
  5.times do |sheep|
    puts sheep
  end
end

puts count_sheep # WRONG: the method will print sheep 5 times and this line will print nothing because the method returns nil. WRONG because sheep is not in quotes, it's a placeholder and .times() is an integer method starting at 0. Read the ruby docs next time.
 
# LS: the .times method iterated 5 times (prints 0 - 4) and returned the initial integer, 5, which puts printed.

=begin
Correct answer: We're using Integer#times within the count_sheep method to count from 0 to 4 (#times starts at 0). 
Therefore, it's no surprise that the output includes 0 through 4. What may be surprising, however, is the fact that the output includes 5. 
Where did that 5 come from? If you study #times in the Ruby docs, you'll know that after iterating 5 times, the block returns the initial integer. 
Which, in this case, is 5.
We can use this knowledge combined with what we learned from the previous exercises to determine why 5 was printed. 
When looking at count_sheep we can see that the #times block is the only code in the method. This means it's also the last line in the method. 
Since #times returns the initial integer, we now know that the return value of count_sheep is 5.
=end

# 8. What will the following code print? Why? Don't run it until you've attempted to answer.
def count_sheep
  5.times do |sheep|
    puts sheep
  end
  10
end

puts count_sheep # This code will print 0, 1, 2, 3, 4 from inside the method and 10 from outside the method. 0 1 2 3 4 10

# 9. What will the following code print? Why? Don't run it until you've attempted to answer.

def count_sheep
  5.times do |sheep|
    puts sheep
    if sheep >= 2
      return
    end
  end
end

p count_sheep

# The method will print 0, 1, 2, nil. The method will break after it prints 2 and p will print nil outside the method since the method returned nil (nothing specified after return).

# 10. What will the following code print? Why? Don't run it until you've attempted to answer.
def tricky_number
  if true
    number = 1
  else
    2
  end
end

puts tricky_number # 1. Default boolean is true which sets number to 1 (*and returns the value that was assigned to the variable) before exi