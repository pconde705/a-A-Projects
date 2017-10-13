require 'byebug'

def first_anagram?(str1, str2)
  anagrams = str1.chars.permutation.to_a
  anagrams.include?(str2.chars)
end


def second_anagram?(str1, str2)
  arr1 = str1.chars
  arr2 = str2.chars
  arr1.each_index do |i|
    arr2.each_index do |j|
      if arr1[i] == arr2[j]
        arr1[i] = nil
        arr2[j] = nil
      end
    end
  end
  arr1.compact.join == '' && arr2.compact.join == ''
end


def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end

def fourth_anagram?(str1, str2)
  hash1 = Hash.new(0)
  str1.chars.each do |el|
    hash1[el] += 1
  end
  str2.chars.each do |el|
    hash1[el] -= 1
  end
  hash1.values.all? { |v| v == 0 }
  # hash2 = Hash.new(0)
  # str2.chars.each do |el|
  #   hash2[el] += 1
  # end

  #  p hash2
  # hash1 == hash2
end
p fourth_anagram?('elvis', 'lives')
p fourth_anagram?("gizmo", "sally")
