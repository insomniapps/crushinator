class Array
  def crushinate
    crushinate_on(:to_s)
  end
  
  def crushinate_on(method = nil, &block)
    block = proc { |e| e.send(method) } if method
    index = {}
    each do |element|
      value = block.call(element).crushinate
      if index.include?(value)
        raise "Duplicate crushinated strings for #{index[value].send(method)} and #{element.send(method)}"
      else
        index[value] = element
      end
    end
    index
  end
end