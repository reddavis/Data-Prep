class Array
  def shuffle
    self.sort_by {rand}
  end
  
  def completely_empty?
    empty?  if dimensions == 1
    empty = true
    each do |n|
      unless n.is_a?(Array)
        empty = false
      else
        empty = false unless n.empty?
      end
    end
    empty
  end
  
  # Taken from David Richards Data Frame
  # (I'll put the url up once I get internet)
  def dimensions(n=0)
    n += 1
    self.first.is_a?(Array) ? self.first.dimensions(n) : n
  end
end