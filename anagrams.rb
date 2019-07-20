def first_anagram?(str1, str2)
  str1.chars.permutation.to_a.include?(str2.chars)
end


def second_anagram?(str1, str2)
  str1.chars.each do |c|
    next if str2.chars.index(c) == nil
    str2[str2.chars.index(c)] = ""
  end
  str2 == ""
end

def third_anagram?(str1, str2)
  str1.chars.sort == str2.chars.sort
end
# def fourth_anagram?(str1, str2)
#   hash1 = Hash.new(0)
#   hash2 = Hash.new(0)
#   str1.chars.each { |c| hash1[c] += 1}
#   str2.chars.each { |c| hash2[c] += 1}
#   hash1 == hash2
# end
require "byebug"

def fourth_anagram?(str1, str2)
  hash_counts = Hash.new(0)
  #debugger
  str1.chars.each { |c| hash_counts[c] += 1}
  str2.chars.each { |c| hash_counts[c] -= 1}
  hash_counts.all? { |k,v| v == 0 }
end

# p first_anagram?("gizmo", "sally")
# p first_anagram?("elvis", "lives")
# p second_anagram?("gizmo", "sally")
# p second_anagram?("elvis", "lives")
# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")
p fourth_anagram?("gizmo", "sally")
p fourth_anagram?("elvis", "lives")