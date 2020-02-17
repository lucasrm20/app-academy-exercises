# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.
require 'prime'

def largest_prime_factor(num)
  num.downto(1) do |i|
    return i if (num % i == 0) && Prime.prime?(i)
  end
end

def unique_chars?(str)
  chars_hash = Hash.new(0)

  str.each_char do |c|
    if chars_hash.has_key?(c) && chars_hash[c] >= 1
      return false
    else
      chars_hash[c] += 1
    end
  end

  true
end

def dupe_indices(arr)
  elems_hash = Hash.new { |h, k| h[k] = []}

  arr.each.with_index do |item, index|
    elems_hash[item].push(index)
  end

  elems_hash.select { |k, v| v.length > 1 }
end

def ana_array(arr_1, arr_2)
  return false if arr_1.length != arr_2.length

  arr_1.each do |item|
    return false if !arr_2.include?(item)
  end

  arr_2.each do |item|
    return false if !arr_1.include?(item)
  end

  true
end
