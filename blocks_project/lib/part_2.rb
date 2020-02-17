def all_words_capitalized?(words)
  words.all? { |word| word == word.capitalize }
end

def no_valid_url?(urls)
  urls.none? { |url| url.match?(/\.(com|net|io|org$)/) }
end

def any_passing_students?(students)
  students.any? do |student|
    student[:grades].reduce { |sum, item| sum += item } / student[:grades].length >= 75
  end
end
