# -*- encoding: utf-8 -*-
require './spec/helper'


describe StackMachine do

  before :each do
    @stack = StackMachine.new
  end

  it "must push and pop" do
    @stack.push [:integer, 123]
    @stack.pop.should == [:integer, 123]
  end
  
  it "must push and pop multiple times" do
    @stack.push [:integer, 123]
    @stack.push [:integer, 5]
    @stack.pop.should == [:integer, 5]
    @stack.pop.should == [:integer, 123]
  end
  
  it "must raise error if we try to pop nothing" do
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
  it "must tell it if we try to pop nothing" do
    begin
      @stack.pop
    rescue StackError => ex
      ex.message.should == "Poping a value but the stack is empty."
    end
  end
  
  it "must add two integers" do
    @stack.push [:integer, 123]
    @stack.push [:integer, 5]
    @stack.add
    @stack.pop.should == [:integer, 128]
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
  it "must substract two integers" do
    @stack.push [:integer, 123]
    @stack.push [:integer, 5]
    @stack.sub
    @stack.pop.should == [:integer, 118]
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
end
