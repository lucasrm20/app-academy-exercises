class Code
  
  attr_reader :pegs
  
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }
  
  def self.valid_pegs?(chars_array)
    chars_array.all? { |item| POSSIBLE_PEGS.has_key?(item.upcase) }
  end
  
  def initialize(pegs)
    raise 'invalid pegs' if not self.class.valid_pegs?(pegs)
    
    @pegs = pegs.map { |item| item.upcase }
  end
  
  def self.random(length)
    random_pegs = length
      .times
      .map { POSSIBLE_PEGS.keys.sample }
    
    Code.new(random_pegs)
  end
  
  def self.from_string(pegs_string)
    Code.new(pegs_string.split(''))
  end
  
  def [](index)
    @pegs[index]
  end
  
  def length
    @pegs.length
  end
  
  def num_exact_matches(guess)
    matches = 0
    
    guess.pegs.each_with_index { |item, index| matches += 1 if @pegs[index] == item }
    
    matches
  end
  
  def num_near_matches(guess)
    matches = 0
    
    guess.pegs.each_with_index { |item, index| matches += 1 if @pegs.include?(item) and not @pegs[index] == item }
    
    matches
  end
  
  def ==(code)
    self.length == code.length && self.num_exact_matches(code) == self.length
  end

end
