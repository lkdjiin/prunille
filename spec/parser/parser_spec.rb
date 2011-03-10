# -*- encoding: utf-8 -*-
require './spec/helper'


describe Parser do

  before :all do
    @parser = Parser.new
  end

  it "must postfix a simple addition" do
    result = @parser.parse([[:integer, 1], [:sign, '+'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '+']]
  end
  
  it "must postfix a simple substraction" do
    result = @parser.parse([[:integer, 1], [:sign, '-'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '-']]
  end
  
  it "must postfix a simple multiplication" do
    result = @parser.parse([[:integer, 1], [:sign, '*'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '*']]
  end
  
  it "must postfix a simple division" do
    result = @parser.parse([[:integer, 1], [:sign, '÷'], [:integer, 2]])
    result.should == [[:integer, 1], [:integer, 2], [:sign, '÷']]
  end

end
