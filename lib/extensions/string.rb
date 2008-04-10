class String
  def crushinate!
    gsub!(/[aeiou]/, '')
    gsub!(/[^[:alpha:]]/, '')
    gsub!(/(.)\1+/, '\1')
    self
  end
  
  def crushinate
    to_s.dup.crushinate!
  end
end