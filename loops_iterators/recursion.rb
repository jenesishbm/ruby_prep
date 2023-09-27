# Example
# Let's say you wanted to know what the double of a number was, then the double of that number, etc. Let's say you wanted to double the number until the pre-doubled number is 10 or greater. You could create the following method:

def doubler(start)
  puts start * 2
end

# You can do this much more simply using recursion. Take a look at this version of the method:

def doubler(start)
  puts start
  if start < 10
    doubler(start * 2)
  end
end

# Another Example
# We are using a method that uses recursion to calculate the nth number in the fibonacci sequence. You can learn more about the fibonacci sequence here. Basically, it is a sequence of numbers in which each number is the sum of the previous two numbers in the sequence.

def fibonacci(number)
  if number < 2
    number
  else
    fibonacci(number - 1) + fibonacci(number - 2)
  end
end

puts fibonacci(8)
