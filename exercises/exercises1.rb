# GENERAL EXERCISES

# 1. Use the each method of Array to iterate over [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], and print out each value.
 arr = Array(1..10)
 arr.each {|value| puts value}

# 2. Same as above, but only print out values greater than 5.
arr.each do |value|
  if value > 5
    puts value
  end
end

#3. Now, using the same array from #2, use the select method to extract all odd numbers into a new array.
arr_odd = arr.select{|value| value%2 != 0}

# 4. Append 11 to the end of the original array. Prepend 0 to the beginning.
arr << 11 #adds a value to the end of the array
arr.unshift(0) #adds a value to the front of the array

# 5. Get rid of 11. And append a 3.
 arr.pop
 arr.push(3)

 # 6. Get rid of duplicates without specifically removing any one value.
arr.uniq!

# 7. What's the major difference between an Array and a Hash?
# An array ([]) is a collection of values. A hash ({}) is a collection of key-pairs, including keys and their corresponding values, like a dictionary.
# The major difference between an array and a hash is that a hash contains a key value pair for referencing by key.

# 8. Create a Hash, with one key-value pair, using both Ruby syntax styles.

hash = { color: "blue" }
hash = { :color => "blue" }

#. 9. Suppose you have a hash h = {a:1, b:2, c:3, d:4}

h = {a:1, b:2, c:3, d:4}

# 9.1. Get the value of key `:b`.
h[:b]

# 9.2. Add to this hash the key:value pair `{e:5}`
h[:e] = 5

# 9.3. Remove all key:value pairs whose value is less than 3.5
h.delete_if { |key, value| value < 3.5 } #DELETE_IF METHOD for hashes

# 10. Can hash values be arrays? Can you have an array of hashes? (give examples)

# Yes, hash values can be arrays. They can also be string, integers, symbols, even other hashes. You can have an array of hashes as well. 
array_hash = {names: ['bob', 'joe', 'susan']}
hash_array = [{name: 'bob'}, {name: 'joe'}, {name: 'susan'}]

# 11. Given the following data structures, write a program that copies the information from the array into the empty hash that applies to the correct person.

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]

contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}

# Expected output:
#  {
#    "Joe Smith"=>{:email=>"joe@email.com", :address=>"123 Main st.", :phone=>"555-123-4567"},
#    "Sally Johnson"=>{:email=>"sally@email.com", :address=>"404 Not Found Dr.",  :phone=>"123-234-3454"}
#  }

contacts["Joe Smith"][:email] = contact_data[0][0]
contacts["Joe Smith"][:address] = contact_data[0][1]
contacts["Joe Smith"][:phone] = contact_data[0][2]
contacts["Sally Johnson"][:email] = contact_data[1][0]
contacts["Sally Johnson"][:address] = contact_data[1][1]
contacts["Sally Johnson"][:phone] = contact_data[1][2]

p contacts

# 12. Using the hash you created from the previous exercise, demonstrate how you would access Joe's email and Sally's phone number.
p contacts["Joe Smith"][:email]
p contacts["Sally Johnson"][:phone]

p "Joe's email is #{contacts["Joe Smith"][:email]}"
p "Sally's phone number is #{contacts["Sally Johnson"][:phone]}"

# 13. Use Ruby's Array method delete_if and String method start_with? to delete all of the strings that begin with an "s" in the following array.
winter_arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']

winter_arr.delete_if { |string| string.start_with?("s")}

# Then recreate the arr and get rid of all of the strings that start with "s" or start with "w".
winter_arr = ['snow', 'winter', 'ice', 'slippery', 'salted roads', 'white trees']
winter_arr.delete_if { |string| string.start_with?("s", "w")}

# 14. Take the following array and turn it into a new array that consists of strings containing one word. (ex. ["white snow", etc...] → ["white", "snow", etc...]. Look into using Array's map and flatten methods, as well as String's split method.

a = ['white snow', 'winter wonderland', 'melting ice','slippery sidewalk', 'salted roads', 'white trees']

a = a.map {|item| item.split(" ")}.flatten

# 15. What will the following program output?

hash1 = {shoes: "nike", "hat" => "adidas", :hoodie => true}
hash2 = {"hat" => "adidas", :shoes => "nike", hoodie: true}

if hash1 == hash2
  puts "These hashes are the same!"
else
  puts "These hashes are not the same!"
end

# These hashes are the same. Same pairs, just different syntax and order. Order doesn't matter for comparison since we retrieve values for each key.

=begin
16. Challenge: In exercise 11, we manually set the contacts hash values one by one. 
Now, programmatically loop or iterate over the contacts hash from exercise 11, and populate the associated data from the contact_data array. 
Hint: you will probably need to iterate over ([:email, :address, :phone]).
Some helpful methods might be the Array shift and first methods.
Note that this exercise is only concerned with dealing with 1 entry in the contacts hash at a time.
=end

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
keys = [:email, :address, :phone]

# one entry at a time
contact_data[0].each{|value| contacts["Joe Smith"][keys.shift] = value} #works but different than LS solution

#LS solution:
contact_data = ["joe@email.com", "123 Main st.", "555-123-4567"]
contacts = {"Joe Smith" => {}}
fields = [:email, :address, :phone]

contacts.each do |name, hash|
  fields.each do|field| 
    hash[field] = contact_data.shift
  end
end

# multiple entries at a time

contact_data = [["joe@email.com", "123 Main st.", "555-123-4567"], ["sally@email.com", "404 Not Found Dr.", "123-234-3454"]]
contacts = {"Joe Smith" => {}, "Sally Johnson" => {}}
fields = [:email, :address, :phone]

contacts.each_with_index do |(name, hash), idx|
  fields.each do |field|
    hash[field] = contact_data[idx].shift
  end
end