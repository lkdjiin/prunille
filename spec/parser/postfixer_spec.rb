# -*- encoding: utf-8 -*-
require './spec/helper'


describe Postfixer do

  before :all do
    @postfixer = Postfixer.new
  end

  it "must not touch a single integer" do
    result = @postfixer.postfix([[:integer, 1]])
    result.should == [[:integer, 1]]
  end
  
  it "must postfix a simple addition" do
    result = @postfixer.postfix([[:integer, 1], [:sign, '+'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '+']]
  end
  
  it "must postfix a simple substraction" do
    result = @postfixer.postfix([[:integer, 1], [:sign, '-'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '-']]
  end
  
  it "must postfix a simple multiplication" do
    result = @postfixer.postfix([[:integer, 1], [:sign, '*'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '*']]
  end
  
  it "must postfix a simple division" do
    result = @postfixer.postfix([[:integer, 1], [:sign, '÷'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '÷']]
  end
  
  it "must postfix a simple modulo" do
    result = @postfixer.postfix([[:integer, 1], [:sign, '%'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '%']]
  end
  
  it "must postfix 1 + 2 * 3" do
    result = @postfixer.postfix([[:integer, 1], [:sign, '+'], [:integer, 2], [:sign, '*'], [:integer, 3]])
    result.should == [[:integer, 1], [:integer, 2], [:integer, 3], [:sign, '*'], [:sign, '+']]
  end

end
