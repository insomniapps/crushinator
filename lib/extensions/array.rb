class Array
  def crushinate
    index = {}
    each do |element|
      value = element.crushinate
      if index.include?(value)
        raise "Duplicate crushinated strings"
      else
        index[value] = element
      end
    end
    index
  end
end