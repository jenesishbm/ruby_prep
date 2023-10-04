## METHODS

# 1. Write a method named print_me that prints I'm printing within the method! when invoked as follows:
def print_me
  puts "I'm printing within the method!" #prints string but returns nil
end

print_me

# 2. Write a method named print_me so that I'm printing the return value! is printed when running the following code:
def print_me
  "I'm printing the return value"
end

puts print_me

# 3. Write two methods, one that returns the string "Hello" and one that returns the string "World". Then print both strings using #puts, combining them into one sentence.
 
def hello
  "Hello"
end

def world
  "World"
end

puts hello + " " + world
puts "#{hello} #{world}"

# 4. Write a method named greet that invokes the hello and world methods:

def hello
  "Hello"
end

def world
  "World"
end

def greet
  "#{hello} #{world}"
  # or hello + " " + world
end

puts greet

# 5. Using the following code, write a method called car that takes two arguments and prints a string containing the values of both arguments.
def car(make, model)
  puts make + " " + model
end

car('Toyota', 'Corolla')

# 6. The variable below will be randomly assigned as true or false. Write a method named time_of_day that, given a boolean as an argument, prints "It's daytime!" if the boolean is true and "It's nighttime!" if it's false. Pass daylight into the method as the argument to determine whether it's day or night.

daylight = [true, false].sample

def time_of_day(boolean)
  puts "It's daytime!" if true
  puts "It's nighttime!" if false
end

time_of_day(daylight)

# 7. Update the below method definitions and method invocations as necessary so that the names are printed as shown:
def dog(name)
  return name
end

def cat(name)
  return name
end

puts "The dog's name is #{dog('Spot')}."
puts "The cat's name is #{cat('Ginger')}."

# 8. Write a method that accepts one argument, but doesn't require it. The parameter should default to the string "Bob" if no argument is given. The method's return value should be the value of the argument.
def assign_name(name = "Bob")
  return name
end

puts assign_name('Kevin') == 'Kevin' # true
puts assign_name == 'Bob' # true

# 9. Write the following methods so that each output is true.
def add(one, two)
  one + two
end

def multiply(one, two)
  one * two
end

puts add(2, 2) == 4 #true
puts add(5, 4) == 9 #true
puts multiply(add(2, 2), add(5, 4)) == 36 #true

# 10. The variables below are both assigned to arrays. The first one, names, contains a list of names. The second one, activities, contains a list of activities. Write the methods name and activity so that they each take the appropriate array and return a random value from it. Then write the method sentence that combines both values into a sentence and returns it from the method.

names = ['Dave', 'Sally', 'George', 'Jessica']
activities = ['walking', 'running', 'cycling']

def name(arr = names)
  arr.sample # pick a random value from array
end

def activity(arr = activities)
  arr.sample # pick a random value from array
end

def sentence(name, activity)
  "#{name} was #{activity} today!"
end

puts name(names)
puts activity(activities)
puts sentence(name(names), activity(activities))
