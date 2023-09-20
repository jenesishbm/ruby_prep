# METHODS

# 1. Write a program that prints a greeting message. This program should contain a method called greeting that takes a name as its parameter and returns a string.

def greeting(name)
  "Hi there " + name + ". How are you?"
end

puts greeting("Jenesis")

# 2. What do the following expressions evaluate to? That is, what value does each expression return?
# 2.1 => 2
# 2.2 => nil
# 2.3 => "Joe"
# 2.4 => "four"
# 2.5 => nil

# 3. Write a program that includes a method called multiply that takes two arguments and returns the product of the two numbers.
def multiply(x,y)
  x*y
end

p multiply(5,3)

# 4. What will the following code print to the screen?

def scream(words)
  words = words + "!!!!"
  return
  puts words
end

scream("Yippeee")

# Nothing because the code stops running after the return statement

# 5. Edit the method definition in exercise #4 so that it does print words on the screen. 
def scream(words)
  words = words + "!!!!"
  puts words
end

scream("Yippeee")

# 5.2 What does it return now? 
# It prints "Yippeee!!!!" but returns nil since puts/print statements return nil

# 6. What does the following error message tell you?
#That the wrong number of arguments was entered into a method. For example, only entering one number in multiply(x,y) method.