require_relative '../lib/are_anagrams'


puts 'Enter first String'
first_string = gets.chomp

puts 'Enter second String'
second_string = gets.chomp

puts "Are my strings anagrams? : #{ AreAnagrams.are_anagrams?(first_string, second_string) }"
