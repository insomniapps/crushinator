class String
  def crushinate!
    gsub!(/[aeiou]/, '')
    gsub!(/[^[:alpha:]]/, '')
    gsub!(/(.)\1+/, '\1')
    downcase!
    self
  end
  
  def crushinate
    to_s.dup.crushinate!
  end
end