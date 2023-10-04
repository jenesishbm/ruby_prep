## VARIABLE SCOPE

# 1. What will the following code print and why? Don't run it until you have tried to answer.

a = 7

def my_value(b)
  b += 10
end

my_value(a) #17
puts a #7

=begin
This code will print 7. Numbers in Ruby are immutable. 
Thus, there is no way for my_value to mutate the value referenced by b, which means that my_value does not (and can not) change the object referenced by a (7).
=end

# 2. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(a)
  a += 10
end

my_value(a) #17
puts a #7

=begin
This code will print 7 again. Numbers in Ruby are immutable. Thus, there is no way for my_value to mutate the value referenced by a, which means that my_value does not (and can not) change the object referenced by a (7).
=end

# 3. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  a = b
end

my_value(a + 5) #12
puts a #7

=begin
This code will print 7 again. Outside of the method, a is still unchanged and equal to 7.
LS: Once again, the result is 7. Once again, the local variable a inside the my_value method definition is not visible outside the my_value method definition. Furthermore, the local variable a at the top level is not visible inside my_value because method definitions are self-contained with respect to local variables.
=end

# 4. What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b[2] = '-'
end

my_value(a)
puts a #"Xy-zy"

=begin
This code will print Xy-zy. Strings are mutable - they can be modified - and, in particular, the method String#[]= is a mutating method; it actually modifies the string. 
Since we are actually modifying the string referenced by b, and b references the same string as a, the result from printing a shows an update to the value of the string.
=end

# 5. What will the following code print, and why? Don't run the code until you have tried to answer.

a = "Xyzzy"

def my_value(b)
  b = 'yzzyX'
end

my_value(a)
puts a

=begin
This code will print "Xyzzy". Assignment never changes the value of an object; instead, it creates a new object, and then stores a reference to that object in the variable on the left. So, at the end of my_value, b references the string 'yzzyX', while a remains unchanged: it still references "Xyzzy".

So, how does this differ from b[2] = '-' in the question above? The key difference with b[2] = '-' is that this is not quite the same as object assignment; it is a call to a method named []=, and this method mutates the String referenced by b; it does not change what object b references, so a continues to reference the modified String.
To summarize, assignment to a variable (an object) never mutates the object that is referenced. However, don't take that too far: if you assign to b[2] like we did in the previous exercise, that's a completely different operation; that actually mutates the content of the String referenced by b.
=end

# 6. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7

def my_value(b)
  b = a + a
end

my_value(a) #14
puts a #7

=begin
This returns an ERROR message since a is not defined inside the method. In other words, even though we define a above the method, inside the method has no idea what a is. Therefore, it is unable to execute.
LS: Even though a is defined before my_value is defined, it is not visible inside my_value. Method definitions are self contained with respect to local variables. Local variables initialized inside the method definition are not visible outside the method definition, and local variables initialized outside the method definition are not visible inside the method definition.
=end

# 7. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |element|
  a = element #3
end

puts a #3

=begin
This code will print 3. The code re-assigns a to each element of the array, which ends with 3.

LS: We are now dealing with a method invocation that has a block. The scoping rules for a method invocation with a block differ from the rules for method definitions. 
With method definitions, local variable scope is restricted to the method definition itself. In contrast, a method invocation with a block has more open scoping rules; 
the block can use and modify local variables that are defined outside the block.
In this case, a starts out as 7, then we set a to 1, 2 and 3 in sequence. By the time we get to the puts, a has a value of 3.
=end

# 8. What will the following code print, and why? Don't run the code until you have tried to answer.

array = [1, 2, 3]

array.each do |element|
  a = element
end

puts a

# This will return an error. A is not defined outside of the block so it cannot be printed outside of the block.

# 9. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

array.each do |a|
  a += 1
end

puts a

=begin 
This will print 7. In the block, a refers to elements of the array. Outside of the block, a remans unchanged (=7).
The array, on the other hand, would be modified in the block to 2, 3, 4.

LS: This problem demonstrates shadowing. Shadowing occurs when a block parameter hides a local variable that is defined outside the block. Since the outer a is shadowed, the a += 1 has no effect on it. In fact, that statement has no effect at all.
=end

# 10. What will the following code print, and why? Don't run the code until you have tried to answer.

a = 7
array = [1, 2, 3]

def my_value(ary)
  ary.each do |b|
    a += b
  end
end

my_value(array)
puts a

=begin
This will return an error. A is not defined inside the method.
LS: This returns an error. a at the top level is not visible inside the invocation of the each method with a block because the invocation of each is inside my_value, and method definitions are self-contained with respect to local variables. Since the outer a is not visible inside the my_value method definition, it isn't visible inside the method invocation with a block.
*Methods are entirely self-contained. Need to define a in the method to avoid this type of error.*
=end