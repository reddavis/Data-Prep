require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Array do
  
  describe "Completly Empty" do
    
    describe "Two Dimensions" do
      it "should return true" do
        [[], [], []].completely_empty?.should be_true
      end
      
      it "should return false" do
        [[], [3], []].completely_empty?.should be_false
      end
      
      it "should return false with weird array" do
        [[], 3].completely_empty?.should be_false
      end
    end
    
    describe "One Dimensions" do
      it "should return true" do
        [].completely_empty?.should be_true
      end
    end
    
  end
  
  describe "Dimensions" do
    it "should be able to determine its dimensions" do
      [1,2,3].dimensions.should eql(1)
      [[1,2,3], [1,2,3]].dimensions.should eql(2)
      [[[1,2,3], [1,2,3]], [[1,2,3], [1,2,3], [[1,2,3], [1,2,3]]]].dimensions.should eql(3)
    end
  
    it "should depend on the first element to determine dimensions" do
      [1, [1,2]].dimensions.should eql(1)
    end
  end
  
end
