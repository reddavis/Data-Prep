require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "DataPrep" do
  
  describe "Creating the data sets" do
    before do
      ham = [[1, 0.5]] * 20
      spam = [[0, 0.2]] * 20
      @data_prep = DataPrep.new(0 => ham, 1 => spam)
    end
    
    it "should spread the data evenly 50:25:25" do
      @data_prep.testing.size.should == 10
      @data_prep.validation.size.should == 10
      @data_prep.training.size.should == 20
    end
    
    it "should inject the outputs" do
      @data_prep.training[0].size.should == 2
    end
    
    it "should hold 2 arrays" do
      @data_prep.training[0][0].class.should == Array
      @data_prep.training[0][1].class.should == Array      
    end
  end
  
  describe "When having a target thats array" do
    before do
      ham = [[1, 0.5]] * 20
      spam = [[0, 0.2]] * 20
      @data_prep = DataPrep.new([0] => ham, [1] => spam)
    end
    
    it "should hold 2 arrays" do
      @data_prep.training[0][1].dimensions.should == 1
    end
  end
  
end
