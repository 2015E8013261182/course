# When done, submit this entire file.

# Part 1

def sum arr
  # YOUR CODE HERE
  if !arr.is_a?(Array) || arr.length == 0
    return 0
  end
  sum = 0
  arr.each { |num| sum += num }
  return sum
end

def max_2_sum arr
  # YOUR CODE HERE
  if !arr.is_a?(Array) || arr.length == 0
    return 0
  end
  if arr.length == 1
    return arr[0]
  end
  arr.sort! #对数组排序
  return arr[arr.length-1] + arr[arr.length-2]
end

def sum_to_n? arr, n
  # YOUR CODE HERE
  if !arr.is_a?(Array) || arr.length == 0
    return false
  end
  for i in 0...arr.length
    for j in (i+1)...arr.length
      if arr[i] + arr[j] == n
        return true
      end
    end
  end
  return false
end

# Part 2

def hello(name)
  # YOUR CODE HERE
  puts "Hello,#{name}"
end

def starts_with_consonant? s
  # YOUR CODE HERE
  if !s.is_a?(String) || s.length == 0
    return false
  end
  str_up = s.upcase
  puts str_up[0]
  if Array['A','E','I','O','U'].include?str_up[0]
    return false
  else
    return true
  end
end

def binary_multiple_of_4? s
  # YOUR CODE HERE
  if !s.is_a?(String) || s.length == 0
    return false
  end
  pattern_1 = /^[01]*00$|^0$/   #允许高位补0
  # pattern_2 = /^1[01]*00$|^0$/  #不允许高位补0
  if s=~ pattern_1
    return true
  end
  return false
end

# Part 3

class BookInStock
  def initialize(isbn,price)
    if !isbn.is_a?(String) || isbn.length == 0 || !price.is_a?(Numeric) || price <=0
      raise ArgumentError
    end
    @isbn = isbn
    @price = price
  end

  def setIsbn=(isbn)
    @isbn = isbn
  end

  def setPrice=(price)
    @price = price
  end

  def getIsbn
    @isbn
  end

  def getPrice
    @price
  end
  def price_as_string
    '$%.2f' % @price
  end

end