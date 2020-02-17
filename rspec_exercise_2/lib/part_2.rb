def palindrome?(str)
  reversed = []
  str.split("").reverse_each { |letter| reversed.push(letter) }

  reversed.join("") == str
end

def substrings(string)
  subs = []

  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      subs << string[start_idx..end_idx]
    end
  end

  subs
end

def palindrome_substrings(string)
  substrings(string).select { |substr| palindrome?(substr) && substr.length > 1 }
end
