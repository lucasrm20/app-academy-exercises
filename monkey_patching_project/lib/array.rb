# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  
  def span
    return nil if self.empty?
		
    self.max - self.min
  end
	
  def average
    return nil if self.empty?
		
    self.sum / (self.length * 1.0)
  end
	
  def median
    return nil if self.empty?
		
    middle = self.length / 2
		
    sorted = self.sort
		
    if self.length.even?
      return (sorted[middle] + sorted[middle - 1]) / 2.0
    end
		
    sorted[middle]
  end
	
  def counts
    hash = Hash.new(0)
		
    self.each do |item|
      hash[item] += 1
    end
		
    hash
  end
	
  def my_count(value)
    self
      .select { |item| item == value }
      .length
  end
	
  def my_index(value)
    self.find_index(value)
  end
	
  def my_uniq
    uniq = []
		
    self.each do |item|
      uniq << item if !uniq.include?(item)
    end
		
    uniq
  end
	
  def my_transpose
    tranposed = []
		
    (1..self.length).each { |subarr| tranposed << Array.new(self.length) }
		
    self.each.with_index do |subarr, i|
      subarr.each.with_index do |item, j|
        tranposed[j][i] = item
      end
    end
		
    tranposed
  end
	
end
