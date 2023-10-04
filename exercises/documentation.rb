## READING DOCUMENTATION 2

# 1. How would you use String#upcase to create an uppercase version of the string "xyz"?
print "xyz".upcase

# 2. How would you use Array#insert to insert the numbers 5, 6, and 7 between the elements with values 'c' and 'd'?
a = %w(a b c d e)
a.insert(3, 5, 6, 7)

# 3. Assume you have the following code. What will each of the 3 puts statements print?

s = 'abc def ghi,jkl mno pqr,stu vwx yz'
puts s.split.inspect #["abc", "def", "ghi,jkl", "mno", "pqr,stu", "vwx", "yz"]
puts s.split(',').inspect #["abc def ghi" , "jkl mno pqr" , "stu vwx yz"]
puts s.split(',', 2).inspect #["abc def ghi" , "jkl mno pqr,stu vwx yz"]