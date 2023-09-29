# 1. Write a program that checks if the sequence of characters "lab" exists in the following strings. If it does exist, print out the word.

arr = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]

def lab_check(word)
  if /lab/i =~ word #add i for case insensitive matches
    puts word
  end
end

arr.each { |word| lab_check(word) }

#2. What will the following program print to the screen? What will it return?

def execute(&block)
  block
end

execute { puts "Hello from inside the execute method!" }

=begin
My answer (WRONG): The above code will print "Hello from inside the execute method!" and return nil.
LS answer: Nothing is printed to the screen because the block is never activated with the .call method. The method returns a Proc object.
=end

# 3. What is exception handling and what problem does it solve?
=begin
My answer: Exception handling is a way to control for anticpated errors using begin/rescue/end.
LS answer: Exception handling is a structure used to handle the possibility of an error occurring in a program. It is a way of handling the error by changing the flow of control without exiting the program entirely.
=end

# 4. Modify the code in exercise 2 to make the block execute properly.
def execute(&block) # ampersand sign & is necessary to allow a block to be passed as a parameter
  block.call
end

execute { puts "Hello from inside the execute method!" }
