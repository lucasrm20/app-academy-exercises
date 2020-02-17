def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(arr)
  arr.reduce(0) { |total, num| total + num } / (arr.length * 1.0)
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  str
    .split(' ')
    .map.with_index do |item, index|
      if index % 2 == 0
        item.upcase 
      else
        item.downcase
      end
    end
    .join(' ')
end
