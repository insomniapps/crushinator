class Array
  def crushinate
    crushinate_on(:to_s)
  end
  
  def crushinate_on(method)
    index = {}
    each do |element|
      value = element.send(method).crushinate
      if index.include?(value)
        raise "Duplicate crushinated strings for #{index[value].send(method)} and #{element.send(method)}"
      else
        index[value] = element
      end
    end
    index
  end
end