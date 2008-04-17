require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "String Extensions" do
  before(:each) do
    @str = "blah"
  end
  
  describe "crushinate" do
    it "should call to_s" do
      @str.should_receive(:to_s).and_return(@str)
      @str.crushinate
    end
    
    it "should return a new string" do
      @str.crushinate.object_id.should_not == @str.object_id
    end
    
    it "should remove capitalization" do
      "XxX".crushinate.should == 'x'
    end
    
    it "should remove non word characters" do
      "blah blah?! (what 123)".crushinate.should == 'blhblhwht'
    end

    it "it should remove vowels" do
      "stupid".crushinate.should == 'stpd'
    end
    
    it "should remove repeating letters" do
      "bllinggg".crushinate.should == 'blng'
    end
    
    it "should remove repeating letters after removing vowels" do
      "kokomo".crushinate.should == 'km'
    end
    
    it "should do everything at once" do
      "H h HEeELl123LOoO".crushinate.should == 'hl'
    end
  end
  
  describe "crushinate!" do
    it "should modify the original string in place" do
      @str.crushinate!
      @str.should == @str.crushinate
    end
  end
end