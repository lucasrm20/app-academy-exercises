require_relative "code"

class Mastermind

  def initialize(length)
    @secret_code = Code.random(length)
  end
  
  def print_matches(code)
    puts @secret_code.num_exact_matches(code)
    puts @secret_code.num_near_matches(code)
  end
  
  def ask_user_for_guess
    print 'Enter a code '
    guess = Code.from_string(gets.chomp)
    
    print_matches(guess)
    @secret_code == guess
  end
  
end
