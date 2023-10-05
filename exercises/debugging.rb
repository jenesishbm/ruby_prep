## DEBUGGING

# 1. You come across the following code. What errors does it raise for the given examples and what exactly do the error messages mean?

def find_first_nonzero_among(numbers)
  numbers.each do |n|
    return n if n.nonzero?
  end
end

# Examples

find_first_nonzero_among(0, 0, 1, 0, 2, 0) # error because this method is expecting an array of integers to be passed in as the argument. 
find_first_nonzero_among(1) # error because this method is expecting an array of integers to be passed in as the argument. 


# 2. Fix this code so it behaves as expected:

def predict_weather
  sunshine = [true, false].sample # changed from sunshine = ['true', 'false'].sample. T or F inside strings messed up our if/else statement.

  if sunshine
    puts "Today's weather will be sunny!"
  else
    puts "Today's weather will be cloudy!"
  end
end

predict_weather

=begin
In order for the method to behave as expected, we should assign sunshine to the Boolean true or false instead of the string 'true' or 'false'.
=end

# 3. When the user inputs 10, we expect the program to print The result is 50!, but that's not the output we see. Why not?

# before debugging
def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp # need to convert to a number

puts "The result is #{multiply_by_five(number)}!"

# after debugging

def multiply_by_five(n)
  n * 5
end

puts "Hello! Which number would you like to multiply by 5?"
number = gets.chomp.to_i

puts "The result is #{multiply_by_five(number)}!"

# 4. Magdalena has just adopted a new pet! She wants to add her new dog, Bowser, to the pets hash. After doing so, she realizes that her dogs Sparky and Fido have been mistakenly removed. Help Magdalena fix her code so that all three of her dogs' names will be associated with the key :dog in the pets hash.

# before
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog] = 'bowser'

p pets #=> {:cat=>"fluffy", :dog=>"bowser", :fish=>"oscar"}

# after
pets = { cat: 'fluffy', dog: ['sparky', 'fido'], fish: 'oscar' }

pets[:dog].push('bowser') # OR pets[:dog] << ('bowser')

p pets

=begin
Her original code re-assigned bowser as the value for :dog instead of adding it to the existing array.
In order to do that, we have to use .push or <<.
=end

# 5. We want to iterate through the numbers array and return a new array containing only the even numbers. However, our code isn't producing the expected output. Why not? How can we change it to produce the expected result?

# before
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.map do |n|
  n if n.even?
end

p even_numbers # expected output: [2, 6, 8]

# after
numbers = [5, 2, 9, 6, 3, 1, 8]

even_numbers = numbers.select do |n|
  n if n.even? # can also simplify to n.even?
end

p even_numbers # output: [2, 6, 8]

=begin
.map iterates through an array and executes some action. 
What we actually want is to selct values that meet a certain condition so we should use .select instead.
=end

# 6. You want to have a small script delivering motivational quotes, but with the following code you run into a very common error message: no implicit conversion of nil into String (TypeError). What is the problem and how can you fix it?

# before
def get_quote(person)
  if person == 'Yoda'
    'Do. Or do not. There is no try.'
  end

  if person == 'Confucius'
    'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

# after
def get_quote(person)
  if person == 'Yoda'
    return 'Do. Or do not. There is no try.' #add return statement
  end

  if person == 'Confucius'
    return 'I hear and I forget. I see and I remember. I do and I understand.'
  end

  if person == 'Einstein'
    return 'Do not worry about your difficulties in Mathematics. I can assure you mine are still greater.'
  end
end

puts 'Confucius says:'
puts '"' + get_quote('Confucius') + '"'

=begin
Since our original code did not have an explicit return statement, the return value is the evaluated result of the last line executed. 
The last line is an if statement, which returns the evaluated result of the branch whose condition evaluates as true, or nil if there is no such branch. 
When we passed 'Confucius' or 'Yoda' in as the argument, the condition person == 'Einstein' evaluated to false, so the last if statement evaluated to nil. 
This caused our original method to return nil every time an argument other than 'Einstein' is passed in.
=end

# 7. The output of the code below tells you that you have around $70. However, you expected your bank account to have about $238. What did we do wrong?

# Financially, you started the year with a clean slate.

balance = 0

# Here's what you earned and spent during the first three months.

january = {
  income: [ 1200, 75 ],
  expenses: [ 650, 140, 33.2, 100, 26.9, 78 ]
}

february = {
  income: [ 1200 ],
  expenses: [ 650, 140, 320, 46.7, 122.5 ]
}

march = {
  income: [ 1200, 10, 75 ],
  expenses: [ 650, 140, 350, 12, 59.9, 2.5 ]
}

# Let's see how much you've got now...

def calculate_balance(month)
  plus  = month[:income].sum
  minus = month[:expenses].sum

  plus - minus
end

[january, february, march].each do |month|
  # original: balance = calculate_balance(month)
  balance += calculate_balance(month) 
end

puts balance

=begin
The original code balance = calculate_balance(month) on line 182 re-assigned balance to the value of the last returned value,
which was March's balance of around $70. Instead, we want to add each month's balance to the final balance, which += does.
=end

# 8. The following code throws an error. Find out what is wrong and think about how you would fix it.
colors = ['red', 'yellow', 'purple', 'green', 'dark blue', 'turquoise', 'silver', 'black']
things = ['pen', 'mouse pad', 'coffee mug', 'sofa', 'surf board', 'training mat', 'notebook']

colors.shuffle!
things.shuffle!

i = 0
loop do
  break if i == things.length # changed from break if i > colors.length

  if i == 0
    puts 'I have a ' + colors[i] + ' ' + things[i] + '.'
  else
    puts 'And a ' + colors[i] + ' ' + things[i] + '.'
  end

  i += 1
end

=begin
Originally, this loop was set to break when i > colors.length. However, since the length of things is shorter than colors, 
we should use that as our breaking metric. Otherwise, for example, the loop will try to print things[7] when there is no value there (nil). 
To fix this, we should set the loop to break when i == things.length since that will be after we have iterated through the entire array of things.

LS: The above solution uses the length of the shorter things array to determine whether to break from the loop or not, and stops as soon as i has a value greater than the last array index.
=end

# 8.5) We might change our arrays in the future and we might not always know which of them is shorter, so picking the shorter one by hand is not the best solution. 
# How can you change the break condition, such that the loop always stops once we hit the end of the shorter array?

break if i == [colors.length, things.length].min


# 9. Given a String of digits, our digit_product method should return the product of all digits in the String argument. You've been asked to implement this method without using reduce or inject (the two methods are aliases).
# When testing the method, you are surprised by a return value of 0. What's wrong with this code and how can you fix it?

def digit_product(str_num)
  digits = str_num.chars.map { |n| n.to_i }
  product = 1 # changed from product = 0

  digits.each do |digit|
    product *= digit
  end

  product
end


p digit_product('12345')
# expected return value: 120
# actual return value: 0

=begin
The product is evaluating to 0 because we initialized product at 0. Any number*0 is 0.
If we initialize product at 1, this should run as planned.
=end

# 10. We started writing an RPG game, but we have already run into an error message. Find the problem and fix it.

# Each player starts with the same basic stats.

player = { strength: 10, dexterity: 10, charisma: 10, stamina: 10 }

# Then the player picks a character class and gets an upgrade accordingly.

character_classes = {
  warrior: { strength:  20 },
  thief:   { dexterity: 20 },
  scout:   { stamina:   20 },
  mage:    { charisma:  20 }
}

puts 'Please type your class (warrior, thief, scout, mage):'
input = gets.chomp.downcase.to_sym # added .to_sym

player.merge!(character_classes[input]) # added ! to merge

puts 'Your character stats:'
puts player

=begin
There were two main bugs to fix. First, on line 269, I added a ! to merge so that changes are destructive/saved.
Second, I added .to_sym to line 267, since we are calling our input as a symbol on line 269. 
=end

