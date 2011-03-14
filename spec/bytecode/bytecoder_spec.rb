# -*- encoding: utf-8 -*-
require './spec/helper'


describe Bytecoder do

  it "must generate bytecode for an addition" do
    coder = Bytecoder.new
    result = coder.generate [[:integer, 123], [:integer, 5], [:sign, '+']]
    result.should == [[:push, 123], [:push, 5], [:add]]
  end
  
  it "must generate bytecode for a substraction" do
    coder = Bytecoder.new
    result = coder.generate [[:integer, 123], [:integer, 5], [:sign, '-']]
    result.should == [[:push, 123], [:push, 5], [:sub]]
  end
  
  it "must generate bytecode for a multiplication" do
    coder = Bytecoder.new
    result = coder.generate [[:integer, 123], [:integer, 5], [:sign, '*']]
    result.should == [[:push, 123], [:push, 5], [:mul]]
  end
  
  it "must generate bytecode for a division" do
    coder = Bytecoder.new
    result = coder.generate [[:integer, 123], [:integer, 5], [:sign, '÷']]
    result.should == [[:push, 123], [:push, 5], [:div]]
  end
  
  it "must generate bytecode for a modulo" do
    coder = Bytecoder.new
    result = coder.generate [[:integer, 123], [:integer, 5], [:sign, '%']]
    result.should == [[:push, 123], [:push, 5], [:mod]]
  end
  
  it "must raise error on unknown unit" do
    coder = Bytecoder.new
    lambda{coder.generate [[:alpha]]}.should raise_error(BytecoderError)
  end
  
  it "must give a meaningful message on error" do
    coder = Bytecoder.new
    begin
      coder.generate [[:alpha]]
    rescue BytecoderError => ex
      ex.message.should == "Unknown type: alpha"
    end
  end

end
