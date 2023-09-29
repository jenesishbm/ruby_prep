# 1. Given a hash of family members, with keys as the title and an array of names as the values, use Ruby's built-in select method to gather only siblings' names into a new array.

family = {  uncles: ["bob", "joe", "steve"],
  sisters: ["jane", "jill", "beth"],
  brothers: ["frank","rob","david"],
  aunts: ["mary","sally","susan"]
}

new_family = family.select{ |k,v| (k == :sisters) || (k == :brothers) }.values.flatten
p new_family

# 2. Look at Ruby's merge method. Notice that it has two versions. What is the difference between merge and merge!? Write a program that uses both and illustrate the differences.

# 3. Using some of Ruby's built-in Hash methods, write a program that loops through a hash and prints all of the keys. Then write a program that does the same thing except printing the values. Finally, write a program that prints both.

opposites = {positive: "negative", up: "down", right: "left"}

opposites.each_key { |key| puts key }

opposites.each_value { |value| puts value }

opposites.each { |key, value| puts "The opposite of #{key} is #{value}" }

# 4. Given the following expression, how would you access the name of the person?

person = {name: 'Bob', occupation: 'web developer', hobbies: 'painting'}

person[:name]

# 5. What method could you use to find out if a Hash contains a specific value in it? Write a program that verifies that the value is within the hash.
# general syntax: hash.value?("value")
opposites.value?("down")

# value? program

if opposites.value?("negative")
  puts "Yep, got it!"
else
  puts "Nope!"
end

# 6. What's the difference between the two hashes that were created?

x = "hi there"
my_hash = {x: "some value"} # hash = the symbol :x
my_hash2 = {x => "some value"} # hash = string "hi there"
