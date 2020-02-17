def reverser(str, &proc)
  proc.call(str.reverse)
end

def word_changer(sentence, &proc)
  sentence.
    split(" ")
    .map do |word|
      proc.call(word)
    end
    .join(" ")
end

def greater_proc_value(num, proc_1, proc_2)
  val_1 = proc_1.call(num)
  val_2 = proc_2.call(num)

  val_1 > val_2 ? val_1 : val_2
end

def and_selector(arr, proc_1, proc_2)
  arr.select { |item| proc_1.call(item) && proc_2.call(item) }
end

def alternating_mapper(arr, proc_1, proc_2)
  arr.map.with_index do |item, index|
    if index.even?
      proc_1.call(item)
    else
      proc_2.call(item)
    end
  end
end
