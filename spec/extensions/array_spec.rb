require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe "Array Extensions" do
  describe "crushinate" do
    before(:each) do
      @array = ['hello', 'world', 'blah']
    end
    
    it "should return a hash" do
      @array.crushinate.should be_an_instance_of(Hash)
    end
    
    it "should call crushinate on each element" do
      @array.each do |value|
        value.should_receive(:crushinate).and_return(value.dup.crushinate)
      end
      @array.crushinate
    end
    
    it "should return the input array as the values of the hash" do
      @array.crushinate.values.sort.should == @array.sort
    end
    
    it "should return the crushinated array as the keys of the hash" do
      @array.crushinate.keys.sort.should == @array.collect { |v| v.crushinate }.sort
    end
    
    it "should associate the proper crushinated string with it's uncrushed value" do
      @array.crushinate[@array.first.crushinate].should == @array.first
    end
    
    it "should raise an error when two inputs crushinate to the same value" do
      proc { (@array << @array.first).crushinate }.should raise_error
    end
  end
end
