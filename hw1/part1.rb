def palindrome?(str)
  str.downcase.gsub(/[^a-z]/,'') == str.reverse.downcase.gsub(/[^a-z]/, '')
end

def count_words(str)
  h = Hash.new
  array = str.downcase.gsub(/[^a-z ]/, '').split(' ')
  array.each{|word| h[word] = array.count(word)}
  h
end
