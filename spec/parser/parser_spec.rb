# -*- encoding: utf-8 -*-
require './spec/helper'


describe Parser do

  before :all do
    @parser = Parser.new(SymbolTable.new)
  end
  
  it "must parse a single integer" do
    result = @parser.parse('123')
    result.should == [[:integer, 123]]
  end
  
  it "must parse an addition" do
    result = @parser.parse('123 + 5')
    result.should == [[:integer, 123], [:integer, 5], [:sign, '+']]
  end
  
  it "must parse a substraction" do
    result = @parser.parse('123 - 5')
    result.should == [[:integer, 123], [:integer, 5], [:sign, '-']]
  end
  
  it "must parse a multiplication" do
    result = @parser.parse('123 * 5')
    result.should == [[:integer, 123], [:integer, 5], [:sign, '*']]
  end
  
  it "must parse a division" do
    result = @parser.parse('123 ÷ 5')
    result.should == [[:integer, 123], [:integer, 5], [:sign, '÷']]
  end
  
  it "must parse a modulo" do
    result = @parser.parse('123 % 5')
    result.should == [[:integer, 123], [:integer, 5], [:sign, '%']]
  end
  
  it "must parse 1 - 2 * 3" do
    result = @parser.parse('1 - 2 * 3')
    result.should == [[:integer, 1], [:integer, 2], [:integer, 3], [:sign, '*'], [:sign, '-']]
  end

end
