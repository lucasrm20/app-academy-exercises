class Board
  
  attr_reader :size
  
  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end
  
  def [](position)
    x = position[0]
    y = position[1]
    
    @grid[x][y]
  end
  
  def []=(position, new_value)
    x = position[0]
    y = position[1]
    
    @grid[x][y] = new_value
  end
  
  def num_ships
    @grid.reduce(0) do |total, sub_arr|
      total += sub_arr.count { |item| item == :S }
    end
  end
  
  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts 'you sunk my battleship!'
      
      return true
    else
      self[position] = :X
      
      return false
    end
  end
  
  def place_random_ships
    (@size / 4).times do
      not_set = true
      
      while not_set
        position = Array.new(2) { (0...@grid.length).to_a.sample }
        
        if self[position] != :S
          self[position] = :S
          not_set = false
        end        
      end
    end
  end
  
  def hidden_ships_grid
    @grid.map do |sub_arr|
      sub_arr.map { |item| item == :S ? :N : item }
    end
  end
  
  def self.print_grid(grid)
    grid.each do |sub_arr|
      puts sub_arr.join(' ')
    end
  end
  
  def cheat
    Board.print_grid(@grid)
  end
  
  def print
    Board.print_grid(hidden_ships_grid)
  end
  
end
