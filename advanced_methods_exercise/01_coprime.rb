# Write a method, coprime?(num_1, num_2), that accepts two numbers as args.
# The method should return true if the only common divisor between the two numbers is 1.
# The method should return false otherwise. For example coprime?(25, 12) is true because
# 1 is the only number that divides both 25 and 12.
def divisible?(num, divisor)
  num % divisor == 0
end

def coprime?(num_1, num_2)
  lower_num = [num_1, num_2].min
  divisors = []

  (1..lower_num).each do |i|
    divisors << i if divisible?(num_1, i) && divisible?(num_2, i)
  end

  divisors.length == 1
end

p coprime?(25, 12)    # => true
p coprime?(7, 11)     # => true
p coprime?(30, 9)     # => false
p coprime?(6, 24)     # => false
