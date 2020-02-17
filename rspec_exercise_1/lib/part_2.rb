def hipsterfy(str)
  if !str.match?(/[aeiou]/)
    return str
  end

  last_vowel_index = str.rindex(/[aeiou]/)
  str[last_vowel_index] = ''

  str
end

def vowel_counts(str)
  vowels_hash = Hash.new(0)

  str
    .downcase
    .split('')
    .each do |letter|
      vowels_hash[letter] += 1 if letter.match?(/[aeiou]/)
    end

  return vowels_hash
end

def caesar_cipher(message, n)
  message
    .split('')
    .each.with_index do |letter, index|
      if (letter.match?(/[a-z]/i))
        n.times { message[index] = message[index].next[0] }
      end
      
    end
    .join('')

  message
end
