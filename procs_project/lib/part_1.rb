def my_map(arr, &proc)
  new_arr = []
  
  arr.each do |item|
    new_arr << proc.call(item)
  end

  new_arr
end

def my_select(arr, &proc)
  new_arr = []
  
  arr.each do |item|
    new_arr << item if proc.call(item)
  end

  new_arr
end

def my_count(arr, &proc)
  new_arr = []
  
  arr.each do |item|
    new_arr << item if proc.call(item)
  end

  new_arr.length
end

def my_any?(arr, &proc)
  new_arr = []
  
  arr.each do |item|
    return true if proc.call(item)
  end

  false
end

def my_all?(arr, &proc)
  new_arr = []
  
  arr.each do |item|
    return false if !proc.call(item)
  end

  true
end

def my_none?(arr, &proc)
  new_arr = []
  
  arr.each do |item|
    return false if proc.call(item)
  end

  true
end