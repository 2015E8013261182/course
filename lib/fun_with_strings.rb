module FunWithStrings
  def palindrome?
    # your code here
    new_str = self.gsub(/\W/, '').downcase
    puts new_str.reverse, new_str
    if new_str.eql?(new_str.reverse)
      return true
    end
    return false
  end
  def count_words
    # your code here
    new_str = self.downcase
    str_arr = new_str.split(/\s/)
    str_hash = Hash.new
    str_arr.each do |val|
      strip_str = /[a-z]*/.match(val)[0]
      if strip_str==''
        next
      end
      if str_hash.has_key?strip_str
        count = str_hash[strip_str]
        count += 1
        str_hash[strip_str] = count
      else
        str_hash[strip_str] = 1
      end
    end
    return str_hash
  end
  def anagram_groups
    # your code here
    str_array = self.split(/\s/)
    hash_map = Hash.new
    # 遍历数组
    str_array.each_with_index { |val, index |
      sorted_str = val.chars.sort.join
      if hash_map.has_key? sorted_str
        hash_value = hash_map[sorted_str]
        hash_value.push(str_array[index])
      else
        hash_value = Array[str_array[index]]
        hash_map[sorted_str] = hash_value
      end
    }
    # 遍历hash放到list
    res = Array.new
    hash_map.each { |key, val|
      res.push(val)
    }
    return res
  end
end

# make all the above functions available as instance methods on Strings:

class String
  include FunWithStrings
end
#
# #
# # str = 'To be or not to be'
# # puts str.split(/\s/)
# # puts str.count_words
# str = 'scream cars for four scar creams'
# puts "#{str.anagram_groups}"
# hash = ''.count_words
# puts "#{hash.kind_of?(Hash)}"
# anagrams =  'scream cars for four scar creams'.anagram_groups
# anagrams.each { |group| group.sort! }
# puts "#{anagrams}"
#
# [%w(cars scar), %w(four), %w(for), %w(creams scream)].each do |group|
#   puts "#{group}"
#   puts anagrams.include?(group)
# end