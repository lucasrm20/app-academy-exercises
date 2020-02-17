def partition(arr, num)
  [
    arr.filter { |n| n < num },
    arr.filter { |n| n >= num }
  ]
end

def merge(hash_1, hash_2)
  new_hash = {}

  hash_1.each do |key, value|
    new_hash[key] = value
  end

  hash_2.each do |key, value|
    new_hash[key] = value
  end

  return new_hash
end

def censor(sentence, curse_words)
  new_sentence = []

  sentence
    .split(" ")
    .each do |word|
      if (curse_words.include?(word.downcase))
        new_sentence << word.gsub(/[aeiou]/i, "*")
      else
        new_sentence << word
      end
    end

    new_sentence.join(" ")
end

def power_of_two?(num)
  num.to_s(2).count('1') == 1
end
