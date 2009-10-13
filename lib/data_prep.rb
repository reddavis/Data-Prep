require File.dirname(__FILE__) + '/ext/array'

class DataPrep
  
  attr_reader :training, :testing, :validation
  
  def initialize(data={})
    inject_outputs(data)
    position_data
  end
  
  private
  
  def inject_outputs(data)
    @data = []
    data.each_pair do |output, data|
      @data << data.map! {|x| [x, [output]]}
    end
  end
  
  def position_data
    @training, @testing, @validation = [], [], []
    @data.map! {|x| x.shuffle}
    
    until @data.completely_empty?
      4.times do |n|
        @data.each do |d|
          if n == 2
            @testing << d.pop
          elsif n == 3
            @validation << d.pop
          else
            @training << d.pop
          end
        end #@data.each
      end #4.times
    end
    @validation.compact!; @testing.compact!; @training.compact!
  end
  
end