# 1. Below we have given you an array and a number. Write a program that checks to see if the number appears in the array.

arr = [1, 3, 5, 7, 9, 11]
number = 3

if arr.include?(number) 
  puts "The array includes #{number}" #true
end

# 2. What will the following programs return? What is the value of arr after each?

1. arr = ["b", "a"] # [b, a]
   arr = arr.product(Array(1..3)) #[b, 1], [b, 2], [b,3], [a, 1]. [a, 2], [a, 3]
   arr.first.delete(arr.first.last) # returns (deletes) 1
   
   #resulting arr = [b], [b, 2], [b,3], [a, 1]. [a, 2], [a, 3]

2. arr = ["b", "a"]
   arr = arr.product([Array(1..3)]) # [["b", [1, 2, 3]], ["a", [1, 2, 3]]]
   arr.first.delete(arr.first.last) # returns (deletes) [1, 2, 3]

   # resulting arr = [["b"], ["a", [1, 2, 3]]]

#3. How do you return the word "example" from the following array?

arr = [["test", "hello", "world"],["example", "mem"]]

arr.last.first

# 4. What does each method return in the following example?

arr = [15, 7, 18, 5, 12, 8, 5, 1]

1. arr.index(5) # 3 -> which is the index of the first 5 in out array

2. arr.index[5] # error because of the square brackets

3. arr[5] # 8 -> which is the value at index 5

# 5. What is the value of a, b, and c in the following program?

string = "Welcome to America!"
a = string[6] #e -> the character at index 6
b = string[11] #A -> the character at index 11
c = string[19] #nil -> index 19 does not exist

#6. Replace margaret with jody

names = ['bob', 'joe', 'susan', 'margaret']
names[3] = 'jody'

#or

names = ['bob', 'joe', 'susan', 'margaret']
names.pop 
names << 'jody'

#7. Use the each_with_index method to iterate through an array of your creation that prints each index and value of the array.
 names.each_with_index { |value, index| puts "#{index + 1}. #{value}"}

# 8. Write a program that iterates over an array and builds a new array that is the result of incrementing each value in the original array by a value of 2. You should have two arrays at the end of this program, The original array and the new array you've created. Print both arrays to the screen using the p method instead of puts.

nums = [1, 2, 3, 4, 5, 6, 7]
new = nums.map { |number| number + 2 }

p nums
p new

# or
arr = [1, 2, 3, 4, 5]
new_arr = []

arr.each { |n| new_arr << n + 2 }

p arr
p new_arr
