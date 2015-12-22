class String

  attr_accessor :occurence_hash
  
  def count_letters
    occurence_hash = Hash.new(0)
    self.gsub(/\s+/, "").split("").each do |letter|
      occurence_hash[letter] += 1
    end
    puts occurence_hash
  end

end
