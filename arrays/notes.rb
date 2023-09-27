=begin

An array is an ordered list of elements that can be of any type. You can define an array by placing a list of elements between brackets like so:

Commands:
* array.first to return first element of an array
* array.last to return last element of an array
* array[3] to call element at third index of the array. Note that indexes start at 0 so the first item in an array is array[0]
* array.pop to delete the last item in an array permanately. Returns the item to be deleted.
* array.push() to add an item to the end of an array permanately.
* array << also works for ^
* array.delete_at() eliminates the value at a certain index from your array.
* array.delete("value") permanently deletes all instances of the provided value from the array.
* array.uniq iterates through an array, deletes any duplicate values that exist, then returns the result as a new array. Does not change original array.
* array.uniq! changes original array permanately
* array.select { |number| number > 4 } iterates over an array and returns a new array that includes any items that return true to the expression provided
* array.sort sorts an array and returns it sorted
* .each and .map can both be used to apply a block of code to every value in an array.
* use each for iteration and map for transformation
* .each iterates but does not change the original array
* .map applies code to each value and updates the original array to new values


=end
