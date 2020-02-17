def select_even_nums(nums)
  # nums.select { |num| num % 2 == 0 }
  nums.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject { |dog| dog['age'] <=2 }
end

def count_positive_subarrays(array_2d)
  # array_2d.count { |sub_array| sub_array.reduce { |sum, item| sum += item } > 0 }
  array_2d.count { |sub_array| sub_array.sum > 0 }
end

def aba_translate(str)
  str
    .split('')
    .map do |letter|
      if 'aeiou'.include?(letter)
        letter + 'b' + letter
      else
        letter
      end
    end
    .join('')
end

def aba_array(words)
  words.map { |word| aba_translate(word) }
end