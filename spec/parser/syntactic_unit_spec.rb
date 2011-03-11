# -*- encoding: utf-8 -*-
require './spec/helper'


describe SyntacticUnit do

  it "must be created from a lexical unit" do
    lambda{SyntacticUnit.new([:integer, 123])}.should_not raise_error
  end
  
  it "must give the type" do
    syn_unit = SyntacticUnit.new([:integer, 123])
    syn_unit.type.should == :integer
  end
  
  it "must give the value" do
    syn_unit = SyntacticUnit.new([:integer, 123])
    syn_unit.value.should == 123
  end
  
  it "must give back the lexical unit" do
    syn_unit = SyntacticUnit.new([:integer, 123])
    syn_unit.to_array.should == [:integer, 123]
  end
  
  it "must accept nil on creation" do
    lambda{SyntacticUnit.new(nil)}.should_not raise_error
  end
  
  it "must provide its own nil? method" do
    syn_unit = SyntacticUnit.new(nil)
    syn_unit.nil?.should == true
    
    syn_unit = SyntacticUnit.new([:integer, 123])
    syn_unit.nil?.should == false
  end

end
