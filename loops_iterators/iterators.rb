# iterator practice

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']

names.each { |name| puts name } # can use { } for single line iteration 

# multi-line iteration with do / end and add a counter variable x

names = ['Bob', 'Joe', 'Steve', 'Janice', 'Susan', 'Helen']
x = 1

names.each do |name|
  puts "#{x}. #{name}"
  x += 1
end

# returns 1. Bob 2. Joe 3. Steve etc...