require_relative './string'

module AreAnagrams
  def self.are_anagrams?(string_a, string_b)
    string_a.length == string_b.length && string_a.count_letters == string_b.count_letters
  end
end
