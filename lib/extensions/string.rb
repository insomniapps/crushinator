class String
  def crushinate!
    gsub!(/[^[:alpha:]]/, '')
    gsub!(/[aeiou]/i, '')
    downcase!
    gsub!(/(.)\1+/, '\1')
    self
  end
  
  def crushinate
    to_s.dup.crushinate!
  end
end