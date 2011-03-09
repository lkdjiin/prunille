# -*- encoding: utf-8 -*-
require './spec/helper'


describe LexicalUnit do

  before :each do
    @unit = LexicalUnit.new(SymbolTable.new)
  end
  
  it "must transform an integer" do
    @unit.produce_from(1234).should == [:integer, 1234]
  end
  
  it "must transform a keyword" do
    @unit.produce_from('new').should == [:keyword, :new]
  end
  
  it "must transform a classname" do
    @unit.produce_from('Foo-Bar').should == [:class, :"Foo-Bar"]
  end
  
  it "must transform an identifier" do
    @unit.produce_from('boeing747').should == [:identifier, :"boeing747"]
  end
  
end
