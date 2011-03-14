# -*- encoding: utf-8 -*-
require './spec/helper'


describe StackMachine do

  before :each do
    @stack = StackMachine.new
  end

  it "must push and pop" do
    @stack.push 123
    @stack.pop.should == 123
  end
  
  it "must push and pop multiple times" do
    @stack.push 123
    @stack.push 5
    @stack.pop.should == 5
    @stack.pop.should == 123
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
    @stack.push 123
    @stack.push 5
    @stack.add
    @stack.pop.should == 128
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
  it "must substract two integers" do
    @stack.push 123
    @stack.push 5
    @stack.sub
    @stack.pop.should == 118
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
  it "must multiply two integers" do
    @stack.push 12
    @stack.push 5
    @stack.mul
    @stack.pop.should == 60
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
  it "must divide two integers" do
    @stack.push 100
    @stack.push 5
    @stack.div
    @stack.pop.should == 20
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
  it "must modulo two integers" do
    @stack.push 6
    @stack.push 5
    @stack.mod
    @stack.pop.should == 1
    lambda{@stack.pop}.should raise_error (StackError)
  end
  
end
